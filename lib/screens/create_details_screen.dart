import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/create/create_details_store.dart';
import 'package:iconapp/widgets/create/create_app_bar.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/input_box.dart';
import 'package:iconapp/widgets/global/user_avatar.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../core/extensions/context_ext.dart';

const _borderStyle = OutlineInputBorder(
  borderSide: BorderSide(
    color: cornflower,
    width: 1.0,
  ),
);

class CreateDetailsScreen extends HookWidget {
  final store = sl<CreateDetailsStore>();

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      return () {
        store.dispose();
      };
    }, const []);

    return WillPopScope(
      onWillPop: () {
        if (store.showPrice) {
          store.setShowPrice(false);
          return Future.value(false);
        }

        return Future.value(true);
      },
      child: BaseGradientBackground(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            AppBarWithDivider(title: LocaleKeys.create_groupNameAppbarTitle.tr()),
            Positioned(
                top: context.heightPlusStatusbarPerc(.13),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CustomText('Set name and photo', style: dialogContent),
                      SizedBox(height: 20),
                      ConversationNameInput(store: store),
                      ConversationTypeSwitch(store: store),
                      SizedBox(height: 20),
                      ConversationTypeDescription(),
                      SizedBox(height: 40),
                      ConversationPriceButton(),
                      SizedBox(height: 20),
                      ConversationExperationButton(),
                    ])),
            ConversationSetPrice(),
            CreateGroupButton(),
          ],
        ),
      ),
    );
  }
}

class ConversationPriceButton extends StatelessWidget {
  final store = sl<CreateDetailsStore>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Visibility(
        visible: store.showPriceButton,
        child: Column(
          children: [
            CustomText('How much the user will pay in Coins', style: dialogContent),
            SizedBox(height: 15),
            CupertinoButton(
              color: store.userSetPrice ? cornflower : dusk,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/money.png',
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(width: 8),
                  CustomText(store.conversationPrice == 0 ? "Set Price" : store.conversationPrice.toString()),
                ],
              ),
              onPressed: () {
                store.setShowPrice(true);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ConversationExperationButton extends StatelessWidget {
  final store = sl<CreateDetailsStore>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Visibility(
        visible: store.showPriceButton,
        child: Column(
          children: [
            CustomText('Select the duration in months', style: dialogContent),
            SizedBox(height: 15),
            CupertinoButton(
              color: cornflower,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(Icons.lock_clock),
                  SizedBox(width: 5),
                  Observer(
                    builder: (_) => CustomText(
                      store.expiration == 0 ? "Never" : expirationMap[store.expiration],
                    ),
                  ),
                ],
              ),
              onPressed: () {
                showCupertinoModalBottomSheet(
                    expand: false,
                    bounce: true,
                    animationCurve: Curves.easeInOut,
                    context: context,
                    builder: (_, controller) {
                      return ListView(
                        shrinkWrap: true,
                        children: expirationMap.entries
                            .map(
                              (e) => CupertinoButton(
                                child: CustomText(e.value),
                                onPressed: () {
                                  store.setExpiration(e.key);
                                  ExtendedNavigator.of(context).pop();
                                },
                              ),
                            )
                            .toList(),
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ConversationSetPrice extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<CreateDetailsStore>();

    final controller = useTextEditingController();
    int currentPrice = store.conversationPrice;
    controller.text = currentPrice.toString();

    return Observer(builder: (_) {
      return Visibility(
        visible: store.showPrice,
        child: Positioned(
          top: MediaQuery.of(context).size.height * .12,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Container(
              width: MediaQuery.of(context).size.width * .6,
              child: Column(
                children: [
                  CustomText('Conversation Price', style: dialogContent),
                  SizedBox(height: 20),
                  TextField(
                      keyboardAppearance: Brightness.light,
                      cursorColor: cornflower,
                      autofocus: true,
                      textAlign: TextAlign.center,
                      style: chatMessageBody,
                      controller: controller,
                      minLines: 1,
                      onChanged: (price) => currentPrice = int.tryParse(price),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          focusedBorder: _borderStyle,
                          enabledBorder: _borderStyle,
                          hintStyle: chatMessageBody,
                          labelText: 'Price',
                          labelStyle: chatMessageName)),
                  SizedBox(height: 20),
                  CustomText(
                    'The price is in Icon credits. For reference, check the items in the "Store" tab.',
                    style: fieldLabel,
                  ),
                  SizedBox(height: 10),
                  CupertinoButton(
                      child: CustomText('open store'),
                      onPressed: () {
                        ExtendedNavigator.of(context).pushRedemptionScreen();
                      }),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoButton(
                        color: cornflower,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CustomText('SET PRICE'),
                        onPressed: () {
                          store.setConversationPrice(currentPrice);
                          store.setShowPrice(false);
                        },
                      ),
                      CupertinoButton(
                        child: CustomText('CANCEL'),
                        onPressed: () {
                          store.setConversationPrice(0);
                          store.setShowPrice(false);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class ConversationTypeDescription extends StatelessWidget {
  final store = sl<CreateDetailsStore>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      child: Observer(
        builder: (_) => CustomText(
          store.getSwitchSelectionDescription,
          style: timeOfMessage.copyWith(height: 1.5, color: white.withOpacity(.7)),
          textAlign: TextAlign.center,
          maxLines: 4,
        ),
      ),
    );
  }
}

class CreateGroupButton extends StatelessWidget {
  final store = sl<CreateDetailsStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Visibility(
        visible: !store.showPrice,
        child: Positioned(
          bottom: 25,
          child: CupertinoButton(
            child: CustomText('CREATE'),
            color: store.isLoading ? whiteOpacity30 : cornflower,
            onPressed: () async {
              if (store.getSelectedPhoto.isEmpty) {
                await context.showFlushbar(color: uiTintColorFill, message: LocaleKeys.create_addPhotoMandatory.tr());
                return;
              }

              final canGoForward = store.groupName.isNotEmpty && !store.isLoading;
              final isPremium = store.currentGroupTypeIndex == 2;
              final userSetPrice = store.conversationPrice > 0;

              if (isPremium && userSetPrice && canGoForward) {
                _createConversation(store, context);
              }

              if (isPremium && !userSetPrice) {
                context.showFlushbar(
                    color: uiTintColorFill, message: "Pelase set a price before creating the conversation");
              }

              if (!isPremium && canGoForward) {
                _createConversation(store, context);
              }
            },
          ),
        ),
      ),
    );
  }

  Future _createConversation(CreateDetailsStore store, BuildContext context) async {
    final res = await store.createGroup();
    res.fold(
      (error) {
        error.when(
          wrongName: () => context.showFlushbar(message: '${store.groupName} exists'),
          generalError: () => context.showFlushbar(message: 'Server error'),
          notAnIcon: () =>
              context.showFlushbar(message: 'You are not an Icon. Only Icons can create a new conversation'),
        );
      },
      (s) async {
        await context.showFlushbar(color: uiTintColorFill, message: '${store.groupName} created');
        ExtendedNavigator.of(context).popUntilPath(Routes.mainNavigator);
      },
    );
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
              contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
              hintStyle: fieldLabel.copyWith(fontSize: 12, color: white.withOpacity(.7)),
              textStyle: fieldLabel.copyWith(color: white.withOpacity(.5)),
              hint: 'example: cooking show',
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
            CustomText("Select conversation type", style: dialogContent),
            SizedBox(height: 28),
            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: CupertinoSlidingSegmentedControl(
                  thumbColor: cornflower,
                  groupValue: store?.currentGroupTypeIndex,
                  children: _conversationTypes(),
                  onValueChanged: (index) {
                    HapticFeedback.lightImpact();
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
