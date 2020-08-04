import 'package:easy_localization/easy_localization.dart';

extension IntExtension on int {
  String humanReadableTime() =>
      DateFormat('h:mm a').format(DateTime.fromMillisecondsSinceEpoch(this));
}
