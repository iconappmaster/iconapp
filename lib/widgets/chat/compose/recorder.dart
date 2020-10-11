import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/stop_watch.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';

class Recorder extends StatelessWidget {
  const Recorder({
    Key key,
    @required this.store,
  }) : super(key: key);

  final ChatStore store;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 15.3),
        SvgPicture.asset(
          'assets/images/microphone.svg',
          height: 18,
          width: 18,
        ),
        SizedBox(width: 8.7),
        RecordingTime(store: store),
      ],
    );
  }
}

class RecordingTime extends StatelessWidget {
  final ChatStore store;

  const RecordingTime({
    Key key,
    @required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: store.recordTimer?.rawTime,
      initialData: 0,
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final timer = snapshot.data;
          final displayTime = StopWatchTimer.getDisplayTime(timer);
          return CustomText(
            displayTime,
            style: chatCompose,
          );
        }

        return Container();
      },
    );
  }
}
