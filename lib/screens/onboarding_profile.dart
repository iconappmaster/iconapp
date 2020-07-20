import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/auth/auth_store.dart';
import 'package:iconapp/widgets/global/plus_circle.dart';
import '../core/extensions/string_ext.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/login/login_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import 'package:iconapp/widgets/global/rolling_switch.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';
import '../core/extensions/context_ext.dart';
import 'package:easy_localization/easy_localization.dart';

final _key = GlobalKey<FormState>();

class OnboardingProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<LoginStore>();
    return BaseGradientWidget(
      child: Observer(
        builder: (_) => Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            IconAppbar(),
            PersonAvatar(),
            PersonDetails(),
            SexPicker(),
            _nextButton(context, store),
          ],
        ),
      ),
    );
  }

  Widget _nextButton(BuildContext ctx, LoginStore store) {
    return Positioned(
      top: ctx.heightPlusStatusbarPerc(.526),
      child: NextButton(
        onClick: () async {
          if (_key.currentState.validate()) {
            sl<AuthStore>().finishedOnboardin();
            ExtendedNavigator.of(ctx).pushNamedAndRemoveUntil(
                Routes.splashScreen, (Route<dynamic> route) => false);
          }
        },
      ),
    );
  }
}

class PersonAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<LoginStore>();
    return Observer(
      builder: (_) => Positioned(
        top: context.heightPlusStatusbarPerc(.138),
        child: GestureDetector(
          onTap: () async => await store.pickPhoto(),
          child: Container(
            width: 80,
            height: 80,
            child: Stack(children: [
              Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(shape: BoxShape.circle, color: white),
                child: store.isUserImageAvailable
                    ? CircleAvatar(
                        backgroundImage: store.getUser.photo.url.showImage())
                    : Center(
                        child: SvgPicture.asset(
                          'assets/images/user_icon.svg',
                          height: 37,
                          width: 37,
                        ),
                      ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: PlusCircle(),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class PersonDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<LoginStore>();
    return Positioned(
      top: context.heightPlusStatusbarPerc(.294),
      child: Form(
        key: _key,
        child: Container(
          width: context.widthPx * .79,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  width: context.widthPx * .547,
                  child: ProfileInput(
                      validator: (value) {
                        if (store.validateUserName()) {
                          return null;
                        }
                        return 'ציין שם ושם משפחה';
                      },
                      title: LocaleKeys.onboarding_profile_name.tr(),
                      onChange: (name) => store.updateUserName(name))),
              Container(
                  width: context.widthPx * .207,
                  child: ProfileInput(
                      validator: (value) {
                        if (store.validateUserAge()) {
                          return null;
                        }
                        return 'מעל גיל 10';
                      },
                      maxLength: 2,
                      keyboardType: TextInputType.number,
                      title: LocaleKeys.onboarding_profile_age.tr(),
                      onChange: (age) =>
                          store.updateUserAge(int.tryParse(age))))
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileInput extends StatelessWidget {
  final String title;
  final Function(String) onChange;
  final TextInputType keyboardType;
  final int maxLength;
  final FormFieldValidator<String> validator;
  const ProfileInput({
    Key key,
    @required this.title,
    @required this.onChange,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HebrewText(title, style: fieldLabel),
        TextFormField(
            key: key,
            validator: validator,
            maxLength: maxLength,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                counterText: '',
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: cornflower)),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: cornflower, width: .7),
                )),
            onChanged: onChange,
            style: fieldInput),
      ],
    );
  }
}

enum GenderType { other, male, female }

class SexPicker extends StatefulWidget {
  @override
  _SexPickerState createState() => _SexPickerState();
}

class _SexPickerState extends State<SexPicker> {
  final store = sl<LoginStore>();

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(width: context.widthPx * .05);
    return Observer(
      builder: (_) => Positioned(
        top: context.heightPlusStatusbarPerc(.45),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RollingSwitch(
                type: GenderType.female,
                value: store.getGenderType == GenderType.female,
                iconOn: 'assets/images/female_white.svg',
                iconOff: 'assets/images/female_purple.svg',
                onTap: () => setGenderType(GenderType.female),
                text: LocaleKeys.onboarding_profile_female.tr(),
                colorOff: Colors.transparent,
                colorOn: cornflower,
                onChanged: (value) => print(store.getGenderType),
              ),
              gap,
              RollingSwitch(
                type: GenderType.male,
                value: store.getGenderType == GenderType.male,
                iconOn: 'assets/images/male_white.svg',
                iconOff: 'assets/images/male_purple.svg',
                onTap: () => setGenderType(GenderType.male),
                text: LocaleKeys.onboarding_profile_male.tr(),
                colorOff: Colors.transparent,
                colorOn: cornflower,
                onChanged: (value) => print(store.getGenderType),
              ),
              gap,
              RollingSwitch(
                type: GenderType.other,
                value: store.getGenderType == GenderType.other,
                iconOn: 'assets/images/other_white.svg',
                iconOff: 'assets/images/other_purple.svg',
                onTap: () => setGenderType(GenderType.other),
                text: LocaleKeys.onboarding_profile_other.tr(),
                colorOff: Colors.transparent,
                colorOn: cornflower,
                onChanged: (value) => print(store.getGenderType),
              )
            ]),
      ),
    );
  }

  void setGenderType(GenderType type) {
    if (store.getGenderType != type) {
      store.setSexType(type);
    }
  }
}
