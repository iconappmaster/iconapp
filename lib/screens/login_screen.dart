import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/domain/core/value_validators.dart';
import 'package:iconapp/stores/login/login_store.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<LoginStore>();

    return Scaffold(
      body: Observer(
        builder: (_) => Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Stepper(
              onStepContinue: () {},
              onStepTapped: (step) => store.state.copyWith(currentStep: step),
              currentStep: store.currentStep,
              physics: BouncingScrollPhysics(),
              type: StepperType.vertical,
              steps: [
                _buildPhoneStep(store),
                _buildSmsStep(store),
              ],
            ),
            if (store.getState.loading) ...[
              Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            ]
          ],
        ),
      ),
    );
  }

  Step _buildPhoneStep(LoginStore store) {
    return Step(
      title: Text('Phone Number'),
      content: Column(
        children: <Widget>[
          TextField(
            onChanged: (phone) => store.updatePhone(phone),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                helperText: 'Enter only the numbers.',
                prefixText: store.state.phonePrefix + ' ',
                labelText: 'Phone No.'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(children: <Widget>[
              RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: black,
                  onPressed: () async => await store.verifyPhone(),
                  child: Text('Next')),
              SizedBox(width: 8.0),
            ]),
          )
        ],
      ),
      isActive: store.currentStep >= 0,
      state: store.currentStep >= 0 ? StepState.complete : StepState.disabled,
    );
  }

  Step _buildSmsStep(LoginStore store) {
    return Step(
      title: Text('Verify Code'),
      content: Column(children: <Widget>[
        TextField(
            maxLength: minCodeLength,
            onChanged: (code) => store.state.copyWith(code: code),
            decoration: InputDecoration(labelText: 'Phone Code'),
            keyboardType: TextInputType.number),
        Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(children: <Widget>[
              RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: black,
                  onPressed: () => store.verifySms(),
                  child: Text('Next')),
              SizedBox(width: 8.0),
            ]))
      ]),
      isActive: store.currentStep >= 0,
      state: store.currentStep >= 1 ? StepState.complete : StepState.disabled,
    );
  }
}
