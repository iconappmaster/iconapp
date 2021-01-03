// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:iconapp/core/dependencies/locator.dart';
// import 'package:iconapp/core/theme.dart';
// import 'package:iconapp/generated/locale_keys.g.dart';
// import 'package:iconapp/stores/redemption_store.dart';
// import 'package:iconapp/widgets/global/custom_text.dart';
// import 'package:iconapp/widgets/global/network_photo.dart';
// import 'package:easy_localization/easy_localization.dart';

// class RedemptionScreen extends StatelessWidget {
//   final store = sl<RedemptionStore>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: darkIndigo2,
//           title: CustomText(LocaleKeys.archive_hidden.tr()),
//         ),
//         body: Observer(builder: (_) {
//           if (store.loading) {
//             return Center(
//                 child: CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation(cornflower),
//             ));
//           }
//           return store.archived.isEmpty
//               ? Center(child: CustomText(LocaleKeys.archive_empty.tr()))
//               : ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: archive.archived.length,
//                   physics: BouncingScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     final conversation = archive.archived[index];
//                     return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: ListTile(
//                             contentPadding: const EdgeInsets.all(8.0),
//                             tileColor: darkIndigo,
//                             leading: ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: NetworkPhoto(
//                                   placeHolder: 'assets/images/group_placeholder.svg',
//                                   placeHolderPadding: 20,
//                                   imageUrl: conversation?.backgroundPhoto?.url ?? '',
//                                   height: 56,
//                                   width: 56),
//                             ),
//                             title: CustomText(
//                               conversation?.name,
//                               style: nameWhite,
//                             ),
//                             dense: false,
//                             trailing: MaterialButton(
//                               onPressed: () => archive.unArchiveConversation(conversation?.id),
//                               child: CustomText(
//                                 'בטל',
//                                 style: systemMessage,
//                               ),
//                             ),
//                           ),
//                         ));
//                   });
//         }));
//   }
// }
