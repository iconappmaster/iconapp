import 'package:easy_localization/easy_localization.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';

extension IntExtension on int {
  String humanReadableTime() =>
      DateFormat('h:mm').format(DateTime.fromMillisecondsSinceEpoch(this));

  String humanReadableMonthTime() =>
      DateFormat('dd.MM').format(DateTime.fromMillisecondsSinceEpoch(this));

  String converastionKey() => '${StorageKey.conversation}_$this';
}
