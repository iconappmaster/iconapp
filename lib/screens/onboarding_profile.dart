import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
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

class OnboardingProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OnboardingWidget(
      child: Observer(
        builder: (_) => Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            OnboardingAppbar(),
            PersonAvatar(),
            PersonDetails(),
            SexPicker(),
            _nextButton(context),
          ],
        ),
      ),
    );
  }

  Widget _nextButton(BuildContext context) {
    return Positioned(
        top: context.heightPlusStatusbarPerc(.506),
        child: NextButton(onClick: () => {}));
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
          onTap: () async {
            final imagePicker = sl<ImagePicker>();
            final pickedFile =
                await imagePicker.getImage(source: ImageSource.gallery);
            await store.showUserPhoto(pickedFile);
          },
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
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: cornflower,
                      border: Border.all(width: 4, color: plusBorder)),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/plus.svg',
                      color: white,
                      height: 14.7,
                      width: 14.7,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class PersonDetails extends StatelessWidget {
  const PersonDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = sl<LoginStore>();
    return Positioned(
      top: context.heightPlusStatusbarPerc(.294),
      child: Container(
        height: context.heightPlusStatusbarPerc(.052),
        width: context.widthPx * .79,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width: context.widthPx * .547,
                child: ProfileInput(
                    title: LocaleKeys.onboarding_profile_name.tr(),
                    onChange: (name) => store.updateUserName)),
            Container(
                width: context.widthPx * .207,
                child: ProfileInput(
                    maxLength: 2,
                    keyboardType: TextInputType.number,
                    title: LocaleKeys.onboarding_profile_age.tr(),
                    onChange: (age) => store.updateUserAge))
          ],
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
  const ProfileInput({
    Key key,
    @required this.title,
    @required this.onChange,
    this.keyboardType = TextInputType.text,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HebrewText(title, style: fieldLabel),
        TextField(
            maxLength: maxLength,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                counterText: '',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: cornflower,
                  ),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: cornflower, width: .7),
                )),
            onChanged: onChange,
            style: fieldInput),
      ],
    );
  }
}

enum SexType { other, male, female }

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
        top: context.heightPlusStatusbarPerc(.41),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RollingSwitch(
                value: store.getSexType == SexType.female,
                iconOn: 'assets/images/female_white.svg',
                iconOff: 'assets/images/female_purple.svg',
                onTap: () => setSexType(SexType.female),
                text: LocaleKeys.onboarding_profile_female.tr(),
                colorOff: Colors.transparent,
                colorOn: cornflower,
                onChanged: (value) => print(value),
              ),
              gap,
              RollingSwitch(
                value: store.getSexType == SexType.male,
                iconOn: 'assets/images/male_white.svg',
                iconOff: 'assets/images/male_purple.svg',
                onTap: () => setSexType(SexType.male),
                text: LocaleKeys.onboarding_profile_male.tr(),
                colorOff: Colors.transparent,
                colorOn: cornflower,
                onChanged: (value) => print(value),
              ),
              gap,
              RollingSwitch(
                value: store.getSexType == SexType.other,
                iconOn: 'assets/images/other_white.svg',
                iconOff: 'assets/images/other_purple.svg',
                onTap: () => setSexType(SexType.other),
                text: LocaleKeys.onboarding_profile_other.tr(),
                colorOff: Colors.transparent,
                colorOn: cornflower,
                onChanged: (value) => print(value),
              )
            ]),
      ),
    );
  }

  setSexType(SexType type) {
    store.setSexType(type);
  }
}
