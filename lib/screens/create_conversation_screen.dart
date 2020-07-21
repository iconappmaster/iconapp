import 'package:flutter/material.dart';
import 'package:iconapp/widgets/create/create_app_bar.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';

class CreateGroupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseGradientWidget(
      child: Stack(
        children: <Widget>[
          CreateGroupAppbar(),
        ],
      ),
    );
  }
}
