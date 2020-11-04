import 'package:easy_localization/easy_localization.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/stores/user/user_store.dart';

extension IntExtension on int {
  String humanReadableTime() => DateFormat('h:mma')
      .format(DateTime.fromMillisecondsSinceEpoch(this * 1000));

  String humanReadableMonthTime() {
    final date = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    
    return DateFormat('dd.MM').format(date);
  }

  String converastionKey() => '${StorageKey.conversation}_$this';

  bool get isMe => sl<UserStore>().getUser.id == this;
}
