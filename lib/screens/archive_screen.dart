import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/archive/archive_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import 'package:iconapp/widgets/global/white_circle.dart';

class ArchiveScreen extends StatefulWidget {
  @override
  _ArchiveScreenState createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  final archive = sl<ArchiveStore>();

  @override
  void initState() {
    archive?.getArchivedConversations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: darkIndigo2,
          title: CustomText('קבוצות מוסתרות'),
        ),
        body: Observer(
          builder: (_) => archive.archived.length == 0
              ? Center(child: CustomText('אין שיחות מוסתרות'))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: archive.archived.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final conversation = archive.archived[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8.0),
                          tileColor: darkIndigo,
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: NetworkPhoto(
                                placeHolder:
                                    'assets/images/group_placeholder.svg',
                                placeHolderPadding: 20,
                                imageUrl:
                                    conversation?.backgroundPhoto?.url ?? '',
                                height: 56,
                                width: 56),
                          ),
                          title: CustomText(
                            conversation?.name,
                            style: nameWhite,
                          ),
                          dense: false,
                          trailing: MaterialButton(
                            onPressed: () =>
                                archive.unArchiveConversation(conversation?.id),
                            child: CustomText(
                              'בטל',
                              style: systemMessage,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ));
  }

  @override
  void dispose() {
    archive?.dispose();
    super.dispose();
  }
}
