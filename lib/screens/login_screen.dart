import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/login/login_store.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<LoginStore>();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Stepper(
            onStepTapped: (step) => store.currentStep = step,
            physics: BouncingScrollPhysics(),
            type: StepperType.vertical,
            steps: [
              _buildPhoneStep(store),
              _buildSmsStep(store),
            ],
          ),
        ],
      ),
    );
  }

  Step _buildPhoneStep(LoginStore store) {
    return Step(
      title: Text('Phone Number'),
      content: Column(
        children: <Widget>[
          TextField(
            onChanged: (phone) => store.phone = phone,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                helperText: 'Enter only the numbers.',
                prefixText: store.phoneCode + ' ',
                labelText: 'Phone No.'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(children: <Widget>[
              RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: black,
                  onPressed: () {
                    RegExp e164 = new RegExp(r'^\+[1-9]\d{1,14}$');
                    if (store.phone.isNotEmpty &&
                        e164.hasMatch(store.phoneCode + store.phone)) {
                      store.verifyPhone();
                      store.currentStep += 1;
                    }
                  },
                  child: Text('Next')),
              SizedBox(width: 8.0),
              RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.black,
                  color: Colors.white,
                  onPressed: () => store.currentStep -= 1,
                  child: Text('Back')),
            ]),
          )
        ],
      ),
      isActive: store.currentStep >= 0,
      state: store.currentStep >= 1 ? StepState.complete : StepState.disabled,
    );
  }

  Step _buildSmsStep(LoginStore store) {
    return Step(
      title: Text('Verify Code'),
      content: Column(children: <Widget>[
        TextField(
            maxLength: 6,
            onChanged: (sms) => store.smsCode,
            decoration: InputDecoration(labelText: 'Phone Code'),
            keyboardType: TextInputType.number),
        FlatButton(
          padding: EdgeInsets.zero,
          child: Text.rich(TextSpan(
              text: 'By clicking Next, you are accepting our ',
              children: [
                TextSpan(
                    text: 'Privacy Policy.',
                    style: TextStyle(decoration: TextDecoration.underline))
              ])),
          onPressed: () {},
        ),
        Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(children: <Widget>[
              RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: black,
                  onPressed: () {
                    if (store.smsCode.length == 6) {
                      store.verifySms();
                    }
                  },
                  child: Text('Next')),
              SizedBox(width: 8.0),
              RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.black,
                  color: Colors.white,
                  onPressed: () => store.currentStep -= 1,
                  child: Text('Back')),
            ]))
      ]),
      isActive: store.currentStep >= 0,
      state: store.currentStep >= 1 ? StepState.complete : StepState.disabled,
    );
  }
}
