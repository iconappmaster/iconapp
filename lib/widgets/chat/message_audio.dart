import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/bus.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/media_repository.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/chat/reply_slider.dart';
import 'package:iconapp/widgets/global/bubble.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/slidable/slidable.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'chat_list.dart';
import 'icon_bubble.dart';

enum PlayerState { stopped, playing, paused }
enum PlayingRouteState { speakers, earpiece }

class VoiceMessage extends StatefulWidget {
  final PlayerMode mode;
  final MessageModel message;
  final bool isMe;
  final int index;
  final AutoScrollController controller;

  VoiceMessage({
    Key key,
    @required this.isMe,
    @required this.message,
    this.mode = PlayerMode.MEDIA_PLAYER,
    @required this.index,
    @required this.controller,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VoiceMessageState();
  }
}

class _VoiceMessageState extends State<VoiceMessage> {
  PlayerMode mode;
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

  SlidableController _controller;
  BuildContext _sliderContext;
  bool _isOpen = false;
  double _progress = 0;
  StreamSubscription _progressSubscription;

  @override
  void initState() {
    super.initState();
    _initSlidable();
    _initAudioPlayer();
    _progressSubscription = sl<Bus>().on<ProgressEvent>().listen((event) {
      if (mounted)
        setState(() {
          _progress = event.progress;
        });
    });
  }

  void _initSlidable() {
    // init reply abilities
    _controller = SlidableController(
      onSlideAnimationChanged: (s) => print(s), // do not remove
      onSlideIsOpenChanged: (isOpen) {
        if (mounted) {
          setState(() async {
            HapticFeedback.lightImpact();
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
    _progressSubscription?.cancel();
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

    return ScrollableTile(
      index: widget.index,
      controller: widget.controller,
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
          child: IconBubble(
            padding: BubbleEdges.only(left: 18, top: 5, right: 5, bottom: 5),
            message: widget.message,
            isMe: widget.isMe,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(widget.message.sender.fullName, style: newMessageNumber),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Slider(
                        inactiveColor: white,
                        activeColor: cornflower,
                        onChanged: (v) {
                          final position = v * _duration.inMilliseconds;
                          _audioPlayer.seek(Duration(milliseconds: position.round()));
                        },
                        value: (_position != null &&
                                _duration != null &&
                                _position.inMilliseconds > 0 &&
                                _position.inMilliseconds < _duration.inMilliseconds)
                            ? _position.inMilliseconds / _duration.inMilliseconds
                            : 0.0,
                      ),
                    ),
                    widget.message.status == MessageStatus.pending
                        ? CircularProgressIndicator(
                            value: _progress,
                            strokeWidth: 1,
                            backgroundColor: cornflower,
                            valueColor: AlwaysStoppedAnimation<Color>(white),
                          )
                        : SizedBox(
                            height: 35,
                            width: 35,
                            child: FloatingActionButton(
                              heroTag: widget.message.id.toString(),
                              onPressed: () => _isPlaying ? _pause() : _play(),
                              elevation: 0,
                              backgroundColor: white,
                              child: AnimatedSwitcher(
                                duration: Duration(milliseconds: 250),
                                transitionBuilder: (child, animation) =>
                                    ScaleTransition(scale: animation, child: child),
                                child: _isPlaying
                                    ? SvgPicture.asset('assets/images/pause.svg',
                                        key: Key('pause_button'), height: 10, width: 10)
                                    : SvgPicture.asset(
                                        'assets/images/play.svg',
                                        height: 10,
                                        width: 10,
                                        key: Key('play_button'),
                                      ),
                              ),
                            ),
                          ),
                  ],
                ),
                Visibility(
                  visible: _position != null,
                  child: Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: CustomText(
                      _position != null
                          ? '${_durationText ?? ''} / ${_positionText ?? ''}'
                          : _duration != null
                              ? _durationText
                              : '',
                      style: newMessageNumber,
                    ),
                  ),
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
      if (mounted) setState(() => _duration = duration);
    });

    _positionSubscription = _audioPlayer.onAudioPositionChanged.listen((p) {
      if (mounted) setState(() => _position = p);
    });

    _playerCompleteSubscription = _audioPlayer.onPlayerCompletion.listen((event) {
      _onComplete();

      if (mounted) setState(() => _position = _duration);
    });

    _playerErrorSubscription = _audioPlayer.onPlayerError.listen((msg) {
      if (mounted)
        setState(() {
          _playerState = PlayerState.stopped;
          _duration = Duration(seconds: 0);
          _position = Duration(seconds: 0);
        });
    });
  }

  Future<int> _play() async {
    final playPosition = (_position != null &&
            _duration != null &&
            _position.inMilliseconds > 0 &&
            _position.inMilliseconds < _duration.inMilliseconds)
        ? _position
        : null;

    final result = await _audioPlayer.play(widget.message.body, position: playPosition);
    if (result == 1 && mounted) setState(() => _playerState = PlayerState.playing);

    // default playback rate is 1.0
    // this should be called after _audioPlayer.play() or _audioPlayer.resume()
    // this can also be called everytime the user wants to change playback rate in the UI
    _audioPlayer.setPlaybackRate(playbackRate: 1.0);

    return result;
  }

  Future<int> _pause() async {
    final result = await _audioPlayer.pause();
    if (result == 1 && mounted) setState(() => _playerState = PlayerState.paused);
    return result;
  }

  void _onComplete() {
    if (mounted) setState(() => _playerState = PlayerState.stopped);
  }
}
