import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../core/extensions/context_ext.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/stores/login/login_store.dart';
import 'package:iconapp/widgets/global/next_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<LoginStore>();
    return Scaffold(
      body: Observer(
        builder: (_) => Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _BackgroundImage(),
            _Logo(),
            NextButton(onClick: () => print('')),
            if (store.getState.loading) ...[
              Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  final logoAsset = '';
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.heightPx * .2,
      child: Column(
        children: <Widget>[SvgPicture.asset(logoAsset)],
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
