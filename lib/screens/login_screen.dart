import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/stores/login/login_store.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final store = sl<LoginStore>();
    return Scaffold(
      body: Observer(
        builder: (_) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) => store.phone = value,
              keyboardType: TextInputType.number,
              decoration:InputDecoration(
                  helperText: 'Enter only the numbers.',
                  prefixText: store.phoneCode + ' ',
                  labelText: 'Phone No.'),
            ),
            MaterialButton(onPressed: () => store.verifyPhone(), child: Text('SEND'),)
          ],
        ),
      ),
    );
  }
}
