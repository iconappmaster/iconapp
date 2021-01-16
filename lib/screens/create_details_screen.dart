import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/create/create_details_store.dart';
import 'package:iconapp/stores/language/language_store.dart';
import 'package:iconapp/widgets/create/create_app_bar.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/input_box.dart';
import 'package:iconapp/widgets/global/user_avatar.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:vibration/vibration.dart';

import '../core/extensions/context_ext.dart';

class CreateDetailsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<CreateDetailsStore>();
    useEffect(
      () {
        return store.dispose();
      },
      const [],
    );

    return BaseGradientBackground(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          AppBarWithDivider(title: LocaleKeys.create_groupNameAppbarTitle.tr()),
          Positioned(
              top: context.heightPlusStatusbarPerc(.164),
              right: context.widthPx * .08,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ConversationNameInput(store: store),
                    ConversationTypeSwitch(store: store),
                  ])),
          ConversationTypeDescription(store: store),
          CreateGroupNavigate(store: store),
        ],
      ),
    );
  }
}

class ConversationTypeDescription extends StatelessWidget {
  const ConversationTypeDescription({
    Key key,
    @required this.store,
  }) : super(key: key);

  final CreateDetailsStore store;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Observer(
        builder: (_) => CustomText(
          store.getSwitchSelectionDescription,
          style: timeOfMessage.copyWith(height: 1.5, color: white.withOpacity(.7)),
        ),
      ),
    );
  }
}

class CreateGroupNavigate extends StatelessWidget {
  const CreateGroupNavigate({
    Key key,
    @required this.store,
  }) : super(key: key);

  final CreateDetailsStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Positioned(
        bottom: 25,
        child: FloatingActionButton(
            heroTag: 'fab1',
            child: RotatedBox(
                quarterTurns: language.isLTR ? 2 : 0,
                child: SvgPicture.asset('assets/images/go_arrow.svg', height: 16.3, width: 16.3)),
            backgroundColor: store.isLoading ? whiteOpacity30 : cornflower,
            onPressed: () async {
              if (store.getSelectedPhoto.isEmpty) {
                await context.showFlushbar(color: uiTintColorFill, message: LocaleKeys.create_addPhotoMandatory.tr());
              }

              if (store.groupName.isNotEmpty && store.getSelectedPhoto.isNotEmpty && !store.isLoading) {
                await _handleSuccess(store, context);
              }
            }),
      ),
    );
  }

  Future _handleSuccess(CreateDetailsStore store, BuildContext context) async {
    final res = await store.createGroup();
    res.fold((e) => context.showFlushbar(message: '${store.groupName} exists'), (s) async {
      await context.showFlushbar(color: uiTintColorFill, message: '${store.groupName} created');
      ExtendedNavigator.of(context).popUntilPath(Routes.mainNavigator);
    });
  }
}

class ConversationNameInput extends StatelessWidget {
  const ConversationNameInput({
    Key key,
    @required this.store,
  }) : super(key: key);

  final CreateDetailsStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Row(
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
          Container(
            width: context.widthPx * .596,
            child: InputText(
              hintStyle: fieldLabel.copyWith(fontSize: 14),
              textStyle: fieldLabel.copyWith(color: white.withOpacity(.5)),
              hint: LocaleKeys.create_groupNameHint.tr(),
              keyboardType: TextInputType.text,
              onChange: (name) => store.updateGroupName(name),
            ),
          ),
        ],
      );
    });
  }
}

class ConversationTypeSwitch extends StatelessWidget {
  const ConversationTypeSwitch({
    Key key,
    @required this.store,
  }) : super(key: key);

  final CreateDetailsStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 18),
            CustomText(LocaleKeys.create_type.tr(), style: fieldLabel),
            SizedBox(height: 28),
            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: CupertinoSlidingSegmentedControl(
                  thumbColor: cornflower,
                  groupValue: store?.currentGroupTypeIndex,
                  children: _conversationTypes(),
                  onValueChanged: (index) {
                    Vibration.vibrate(duration: 50);
                    store.setGroupType(index);
                  }),
            ),
          ],
        ),
      );
    });
  }

  Map<int, Widget> _conversationTypes() => {
        0: CustomText(LocaleKeys.create_public.tr(), style: chatMessageName),
        1: CustomText(LocaleKeys.create_private.tr(), style: chatMessageName),
        2: CustomText(LocaleKeys.create_premium.tr(), style: chatMessageName),
      };
}
