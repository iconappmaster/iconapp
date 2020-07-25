import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/group_create/group_create_store.dart';
import 'package:iconapp/widgets/create/create_app_bar.dart';
import 'package:iconapp/widgets/create_conversation/create_group_slelect_widget.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/user_avatar.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import '../core/extensions/context_ext.dart';
import 'onboarding_profile.dart';
import 'package:easy_localization/easy_localization.dart';

class SelectContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseGradientWidget(
      child: CreateGroupSelectWidget(
        onNextTap: () => ExtendedNavigator.of(context)
            .pushNamed(Routes.selectCategoryScreen),
        nextButtonAsset: 'assets/images/go_arrow.svg',
        appbarTitle: LocaleKeys.create_groupSelectContactAppbarTitle.tr(),
        mode: GroupPickMode.icons,
      ),
    );
  }
}

class SelectCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseGradientWidget(
      child: CreateGroupSelectWidget(
        onNextTap: () =>
            ExtendedNavigator.of(context).pushNamed(Routes.groupNamePhoto),
        nextButtonAsset: 'assets/images/check.svg',
        appbarTitle: LocaleKeys.create_groupSelectCategoryAppbarTitle.tr(),
        mode: GroupPickMode.categories,
      ),
    );
  }
}

class GroupNamePhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseGradientWidget(
      child: Stack(
        children: <Widget>[
          CreateGroupAppbar(title: LocaleKeys.create_groupNameAppbarTitle.tr()),
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
                      onTap: () {
                        // TODO DO SOMETHING!
                      },
                      url: null,
                      placeholder: 'assets/images/camera_icon.svg',
                    ),
                    SizedBox(width: 12.7),
                    Container(
                      width: context.widthPx * .596,
                      child: ProfileInput(
                        hintStyle: flushbar,
                        textStyle: flushbar,
                        hint: LocaleKeys.create_groupNameHint.tr(),
                        keyboardType: TextInputType.text,
                        onChange: (input) => print(input),
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
                child: SvgPicture.asset('assets/images/go_arrow.svg',
                    height: 16.3, width: 16.3),
                backgroundColor: cornflower,
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
