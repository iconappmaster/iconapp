import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/create/create_details_store.dart';
import 'package:iconapp/widgets/create/create_app_bar.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/input_box.dart';
import 'package:iconapp/widgets/global/user_avatar.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import '../core/extensions/context_ext.dart';
import 'package:easy_localization/easy_localization.dart';

class CreateDetailsScreen extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final store = sl<CreateDetailsStore>();
    return Observer(
      builder: (_) => BaseGradientBackground(
        child: Stack(
          children: <Widget>[
            CreateGroupAppbar(
                title: LocaleKeys.create_groupNameAppbarTitle.tr()),
            Positioned(
              top: context.heightPlusStatusbarPerc(.164),
              right: context.widthPx * .08,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      UserAvatar(
                        showLoading: store.isLoading,
                        onTap: () => store.selectGroupPhoto(),
                        url: store.getSelectedPhoto,
                        placeholder: 'assets/images/camera_icon.svg',
                        placeHolderPadding: 20,
                      ),
                      SizedBox(width: 12.7),
                      Form(
                        key: _key,
                        child: Container(
                          width: context.widthPx * .596,
                          child: InputText(
                              validator: (name) => name.isEmpty
                                  ? 'נושא הקבוצה לא יכול להיות ריק'
                                  : null,
                              hintStyle: flushbar,
                              textStyle: flushbar,
                              hint: LocaleKeys.create_groupNameHint.tr(),
                              keyboardType: TextInputType.text,
                              onChange: (name) => store.updateGroupName(name)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 9.7),
                  Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: HebrewText(
                      LocaleKeys.create_groupNameDescription.tr(),
                      style: fieldLabel,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 25,
              left: 25,
              child: FloatingActionButton(
                  heroTag: 'fab1',
                  child: SvgPicture.asset('assets/images/go_arrow.svg',
                      height: 16.3, width: 16.3),
                  backgroundColor:
                      store.isLoading ? whiteOpacity30 : cornflower,
                  onPressed: () async {
                    if (store.getSelectedPhoto.isEmpty) {
                      await context.showFlushbar(
                          color: uiTintColorFill,
                          message: 'חובה להוסיף תמונה');
                    }

                    if (_key.currentState.validate() &&
                        store.getSelectedPhoto.isNotEmpty &&
                        !store.isLoading) {
                      await _handleSuccess(store, context);
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future _handleSuccess(CreateDetailsStore store, BuildContext context) async {
    final res = await store.createGroup();
    res.fold((e) => context.showFlushbar(message: '${store.groupName} קיימת'),
        (s) async {
      await context.showFlushbar(
          color: uiTintColorFill, message: '${store.groupName} נוצרה');
      ExtendedNavigator.of(context).popUntilPath(Routes.splashScreen);
    });
  }
}
