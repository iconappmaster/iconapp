import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/domain/core/value_validators.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/oboarding/onboarding_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/global/input_box.dart';
import 'package:iconapp/widgets/global/user_avatar.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/widgets/global/next_button.dart';
import 'package:iconapp/widgets/global/rolling_switch.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';
import '../core/extensions/context_ext.dart';
import 'package:easy_localization/easy_localization.dart';

final _formValidatorKey = GlobalKey<FormState>();
enum OnboardingMode { onboarding, drawer }

class OnboardingProfile extends StatelessWidget {
  final OnboardingMode mode;

  const OnboardingProfile({Key key, @required this.mode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<OnboardingStore>();
    final user = sl<UserStore>().getUser;

    if (mode == OnboardingMode.drawer) {
      store.initPersonalDetails(user);
    }

    return BaseGradientBackground(
      child: Observer(
        builder: (_) => Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            IconAppbar(
              showBack: !store.getState.loading,
            ),
            Positioned(
              top: context.heightPlusStatusbarPerc(.138),
              child: UserAvatar(
                
                placeholder: 'assets/images/user_icon.svg',
                showLoading: store.getState.loading,
                onTap: () async => store.pickAndUploadPhoto(),
                url: store?.getUserPhoto ?? '',
              ),
            ),
            PersonDetails(),
            if (mode == OnboardingMode.onboarding) SexPicker(),
            _nextButton(context, store),
          ],
        ),
      ),
    );
  }

  Widget _nextButton(BuildContext ctx, OnboardingStore store) {
    return Positioned(
      top: ctx.heightPlusStatusbarPerc(.506),
      child: NextButton(
        title: mode == OnboardingMode.onboarding
            ? LocaleKeys.action_continue.tr()
            : LocaleKeys.action_save.tr(),
        enabled: !store.getState.loading,
        onClick: () {
          if (_formValidatorKey.currentState.validate()) {
            
            store.upadteUser().then((result) => result.fold(
                (error) => ctx.showFlushbar(
                    message: LocaleKeys.general_server_error.tr()),
                (success) => ExtendedNavigator.of(ctx).pushNamedAndRemoveUntil(
                    Routes.splashScreen, (Route<dynamic> route) => false)));
          }
        },
      ),
    );
  }
}

class PersonDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = sl<UserStore>().getUser;
    final store = sl<OnboardingStore>();
    return Positioned(
      top: context.heightPlusStatusbarPerc(.294),
      child: Form(
        key: _formValidatorKey,
        child: Container(
          width: context.widthPx * .79,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  width: context.widthPx * .547,
                  child: InputText(
                      initialValue: user?.fullName ?? '',
                      hint: 'שם ושם משפחה',
                      hintStyle: personalDetailsHint,
                      validator: (value) {
                        if (store.validateUserName()) return null;
                        return 'ציין שם ושם משפחה';
                      },
                      title: LocaleKeys.onboarding_profileName.tr(),
                      onChange: (name) => store.updateUserName(name))),
              Container(
                width: context.widthPx * .207,
                child: InputText(
                  initialValue: user?.age?.toString() ?? '',
                  hint: '$minAge-99',
                  hintStyle: personalDetailsHint,
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  title: LocaleKeys.onboarding_profileAge.tr(),
                  onChange: (age) => store.updateUserAge(int.tryParse(age)),
                  validator: (value) {
                    if (store.validateUserAge()) return null;
                    return 'מעל גיל $minAge';
                  },
                ),
              )
            ],
          ),
        ),
      ),
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

    return Positioned(
      top: context.heightPlusStatusbarPerc(.415),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RollingSwitch(
              onTap: _updateUI,
              onSwipe: _updateUI,
              gender: UserGender.female,
              iconOn: 'assets/images/female_white.svg',
              iconOff: 'assets/images/female_purple.svg',
              text: LocaleKeys.onboarding_profileFemale.tr(),
              colorOff: Colors.transparent,
              colorOn: cornflower,
              onChanged: (value) => genderMap[UserGender.female] = value,
            ),
            gap,
            RollingSwitch(
              onTap: _updateUI,
              onSwipe: _updateUI,
              gender: UserGender.male,
              iconOn: 'assets/images/male_white.svg',
              iconOff: 'assets/images/male_purple.svg',
              text: LocaleKeys.onboarding_profileMale.tr(),
              colorOff: Colors.transparent,
              colorOn: cornflower,
              onChanged: (value) => genderMap[UserGender.male] = value,
            ),
            gap,
            RollingSwitch(
              onTap: _updateUI,
              onSwipe: _updateUI,
              gender: UserGender.other,
              iconOn: 'assets/images/other_white.svg',
              iconOff: 'assets/images/other_purple.svg',
              text: LocaleKeys.onboarding_profileOther.tr(),
              colorOff: Colors.transparent,
              colorOn: cornflower,
              onChanged: (value) => genderMap[UserGender.other] = value,
            )
          ]),
    );
  }

  _updateUI() => setState(() {
        final selectedGender = genderMap.entries.firstWhere((g) => g.value);
        store.updateUserGender(selectedGender.key);
      });
}
