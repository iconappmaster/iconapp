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
        builder: (_) => Stack(
          alignment: Alignment.center,
          children: <Widget>[
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
}
