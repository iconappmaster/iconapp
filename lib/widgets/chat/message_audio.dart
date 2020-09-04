import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/chat/reply_slider.dart';
import 'package:iconapp/widgets/global/bubble.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/like_menu/likes_menu.dart';
import 'package:iconapp/widgets/global/slidable/slidable.dart';

import 'icon_bubble.dart';

enum PlayerState { stopped, playing, paused }
enum PlayingRouteState { speakers, earpiece }

class VoiceMessage extends StatefulWidget {
  final PlayerMode mode;
  final MessageModel message;
  final bool isMe;

  VoiceMessage({
    Key key,
    @required this.isMe,
    @required this.message,
    this.mode = PlayerMode.MEDIA_PLAYER,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VoiceMessageState(message, mode);
  }
}

class _VoiceMessageState extends State<VoiceMessage> {
  PlayerMode mode;
  MessageModel message;

  AudioPlayer _audioPlayer;
  Duration _duration;
  Duration _position;

  PlayerState _playerState = PlayerState.stopped;
  StreamSubscription _durationSubscription;
  StreamSubscription _positionSubscription;
  StreamSubscription _playerCompleteSubscription;
  StreamSubscription _playerErrorSubscription;
  StreamSubscription _playerStateSubscription;

  get _isPlaying => _playerState == PlayerState.playing;
  get _durationText => _duration?.toString()?.split('.')?.first ?? '';
  get _positionText => _position?.toString()?.split('.')?.first ?? '';

  _VoiceMessageState(this.message, this.mode);

  SlidableController _controller;
  BuildContext _sliderContext;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();

    _initSlidable();
    _initAudioPlayer();
  }

  void _initSlidable() {
    _controller = SlidableController(
      onSlideAnimationChanged: (s) => print(s), // do not remove
      onSlideIsOpenChanged: (isOpen) {
        if (mounted) {
          setState(() {
            _isOpen = isOpen;
            sl<ChatStore>().setReplyMessage(widget.message);
            final slide = Slidable.of(_sliderContext);
            Future.delayed(Duration(milliseconds: 250), () => slide.close());
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerErrorSubscription?.cancel();
    _playerStateSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = sl<ChatStore>();
    
    return Likeble(
      message: widget.message,
      child: Replyble(
        isEnabled: store.conversation.userRole != UserRole.viewer,
        isOpen: _isOpen,
        keyName: widget.message.id.toString(),
        controller: _controller,
        builder: (context, index, animation, step) {
          _sliderContext = context;
          return ReplyButton(message: widget.message);
        },
        child: Container(
          margin: EdgeInsets.only(
              left: widget.isMe ? 0 : 100, right: widget.isMe ? 100 : 0),
          child: IconBubble(
            padding: BubbleEdges.all(9),
            message: widget.message,
            isMe: widget.isMe,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Slider(
                          activeColor: strongPink,
                          onChanged: (v) {
                            final position = v * _duration.inMilliseconds;
                            _audioPlayer
                                .seek(Duration(milliseconds: position.round()));
                          },
                          value: (_position != null &&
                                  _duration != null &&
                                  _position.inMilliseconds > 0 &&
                                  _position.inMilliseconds <
                                      _duration.inMilliseconds)
                              ? _position.inMilliseconds /
                                  _duration.inMilliseconds
                              : 0.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: FloatingActionButton(
                        heroTag: widget.message.id.toString(),
                        onPressed: () => _isPlaying ? _pause() : _play(),
                        elevation: 0,
                        backgroundColor: white,
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 250),
                          transitionBuilder: (child, animation) =>
                              ScaleTransition(
                            scale: animation,
                            child: child,
                          ),
                          child: _isPlaying
                              ? SvgPicture.asset(
                                  'assets/images/pause.svg',
                                  key: Key('pause_button'),
                                  height: 12,
                                  width: 12,
                                )
                              : SvgPicture.asset(
                                  'assets/images/play.svg',
                                  height: 12,
                                  width: 12,
                                  key: Key('play_button'),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HebrewText(
                      widget.message.sender.fullName,
                      style: newMessageNumber,
                    ),
                    Text(
                      _position != null
                          ? '${_durationText ?? ''} / ${_positionText ?? ''}'
                          : _duration != null ? _durationText : '',
                      style: newMessageNumber,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _initAudioPlayer() {
    _audioPlayer = AudioPlayer(mode: mode);

    _durationSubscription = _audioPlayer.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);
    });

    _positionSubscription =
        _audioPlayer.onAudioPositionChanged.listen((p) => setState(() {
              _position = p;
            }));

    _playerCompleteSubscription =
        _audioPlayer.onPlayerCompletion.listen((event) {
      _onComplete();
      setState(() {
        _position = _duration;
      });
    });

    _playerErrorSubscription = _audioPlayer.onPlayerError.listen((msg) {
      print('audioPlayer error : $msg');
      setState(() {
        _playerState = PlayerState.stopped;
        _duration = Duration(seconds: 0);
        _position = Duration(seconds: 0);
      });
    });

    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() {
        // _audioPlayerState = state;
      });
    });

    _audioPlayer.onNotificationPlayerStateChanged.listen((state) {
      if (!mounted) return;
      // setState(() => _audioPlayerState = state);
    });
  }

  Future<int> _play() async {
    final playPosition = (_position != null &&
            _duration != null &&
            _position.inMilliseconds > 0 &&
            _position.inMilliseconds < _duration.inMilliseconds)
        ? _position
        : null;

    final result =
        await _audioPlayer.play(this.message.body, position: playPosition);
    if (result == 1) setState(() => _playerState = PlayerState.playing);

    // default playback rate is 1.0
    // this should be called after _audioPlayer.play() or _audioPlayer.resume()
    // this can also be called everytime the user wants to change playback rate in the UI
    _audioPlayer.setPlaybackRate(playbackRate: 1.0);

    return result;
  }

  Future<int> _pause() async {
    final result = await _audioPlayer.pause();
    if (result == 1) setState(() => _playerState = PlayerState.paused);
    return result;
  }

  void _onComplete() {
    setState(() => _playerState = PlayerState.stopped);
  }
}
