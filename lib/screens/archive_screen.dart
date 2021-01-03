import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/archive/archive_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';

class ArchiveScreen extends HookWidget {
  final archive = sl<ArchiveStore>();

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      archive?.getArchivedConversations();
      return () => archive?.dispose();
    }, const []);

    return Scaffold(
        appBar: _appbar(),
        body: BaseGradientBackground(
          child: Observer(
            builder: (_) {
              if (archive.loading) {
                return Center(
                    child: CircularProgressIndicator(
                  strokeWidth: 1,
                  valueColor: AlwaysStoppedAnimation(cornflower),
                ));
              }
              return archive.archived.length == 0
                  ? Center(child: CustomText(LocaleKeys.archive_empty.tr()))
                  : ListView.builder(
                      padding: const EdgeInsets.only(top: 4, bottom: 20),
                      shrinkWrap: true,
                      itemCount: archive.archived.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final conversation = archive.archived[index];
                        return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(8.0),
                                tileColor: darkIndigo,
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: NetworkPhoto(
                                      placeHolder: 'assets/images/group_placeholder.svg',
                                      placeHolderPadding: 20,
                                      imageUrl: conversation?.backgroundPhoto?.url ?? '',
                                      height: 56,
                                      width: 56),
                                ),
                                title: CustomText(conversation?.name, style: nameWhite),
                                dense: false,
                                trailing: MaterialButton(
                                  onPressed: () => archive.unArchiveConversation(conversation?.id),
                                  child: CustomText(LocaleKeys.general_cancel.tr(), style: systemMessage),
                                ),
                              ),
                            ));
                      });
            },
          ),
        ));
  }

  AppBar _appbar() {
    return AppBar(
        centerTitle: true,
        backgroundColor: darkIndigo2,
        title: CustomText(LocaleKeys.archive_hidden.tr()),
      );
  }
}
