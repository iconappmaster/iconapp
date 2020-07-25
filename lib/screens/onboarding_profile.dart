import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/oboarding/onboarding_store.dart';
import 'package:iconapp/widgets/global/user_avatar.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
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
    final store = sl<OnboardingStore>();
    return BaseGradientWidget(
      child: Observer(
        builder: (_) => Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            IconAppbar(),
            Positioned(
              top: context.heightPlusStatusbarPerc(.138),
              child: UserAvatar(
                onTap: () async => await store.pickPhoto(true),
                url: store.getUserPhoto,
              ),
            ),
            PersonDetails(),
            SexPicker(),
            _nextButton(context, store),
          ],
        ),
      ),
    );
  }

  Widget _nextButton(BuildContext ctx, OnboardingStore store) {
    return Positioned(
      top: ctx.heightPlusStatusbarPerc(.526),
      child: NextButton(
        onClick: () async {
          if (_key.currentState.validate()) {
            // sl<LoginStore>().finishedOnboardin();
            store.createUser();
            ExtendedNavigator.of(ctx).pushNamedAndRemoveUntil(
                Routes.splashScreen, (Route<dynamic> route) => false);
          }
        },
      ),
    );
  }
}

class PersonDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<OnboardingStore>();
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
                        if (store.validateUserName()) return null;
                        return 'ציין שם ושם משפחה';
                      },
                      title: LocaleKeys.onboarding_profileName.tr(),
                      onChange: (name) => store.updateUserName(name))),
              Container(
                  width: context.widthPx * .207,
                  child: ProfileInput(
                      validator: (value) {
                        if (store.validateUserAge()) return null;
                        return 'מעל גיל 10';
                      },
                      maxLength: 2,
                      keyboardType: TextInputType.number,
                      title: LocaleKeys.onboarding_profileAge.tr(),
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
  final String hint;
  final TextStyle hintStyle;
  final TextStyle textStyle;
  const ProfileInput({
    Key key,
    this.title,
    @required this.onChange,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.validator,
    this.hint,
    this.hintStyle,
    this.textStyle = fieldInput,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (title != null) HebrewText(title, style: fieldLabel),
        TextFormField(
          key: key,
          validator: validator,
          maxLength: maxLength,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              hintStyle: hintStyle,
              hintText: hint,
              counterText: '',
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: cornflower)),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: cornflower, width: .7),
              )),
          onChanged: onChange,
          style: textStyle,
        ),
      ],
    );
  }
}

class SexPicker extends StatefulWidget {
  @override
  _SexPickerState createState() => _SexPickerState();
}

Map<UserGender, bool> genderMap = {
  UserGender.female: false,
  UserGender.male: true,
  UserGender.other: false,
};

class _SexPickerState extends State<SexPicker> {
  final store = sl<OnboardingStore>();

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(width: context.widthPx * .05);

    return Observer(
      builder: (_) {
        return Positioned(
          top: context.heightPlusStatusbarPerc(.45),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RollingSwitch(
                  onTap: () => setState(() {}),
                  gender: UserGender.female,
                  // value: store.getGenderType == GenderType.female,
                  iconOn: 'assets/images/female_white.svg',
                  iconOff: 'assets/images/female_purple.svg',
                  text: LocaleKeys.onboarding_profileFemale.tr(),
                  colorOff: Colors.transparent,
                  colorOn: cornflower,
                  onChanged: (value) => genderMap[UserGender.female] = value,
                ),
                gap,
                RollingSwitch(
                  onTap: () => setState(() {}),
                  gender: UserGender.male,
                  // value: store.getGenderType == UserGender.male,
                  iconOn: 'assets/images/male_white.svg',
                  iconOff: 'assets/images/male_purple.svg',
                  text: LocaleKeys.onboarding_profileMale.tr(),
                  colorOff: Colors.transparent,
                  colorOn: cornflower,
                  onChanged: (value) => genderMap[UserGender.male] = value,
                ),
                gap,
                RollingSwitch(
                  onTap: () => setState(() {}),
                  gender: UserGender.other,
                  // value: store.getGenderType == UserGender.other,
                  iconOn: 'assets/images/other_white.svg',
                  iconOff: 'assets/images/other_purple.svg',
                  // onTap: () => setGenderType(GenderType.other),
                  text: LocaleKeys.onboarding_profileOther.tr(),
                  colorOff: Colors.transparent,
                  colorOn: cornflower,
                  onChanged: (value) => genderMap[UserGender.other] = value,
                )
              ]),
        );
      },
    );
  }

  
}
