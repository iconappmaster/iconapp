import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/login/login_store.dart';
import 'dart:ui' as ui;
import '../../core/extensions/context_ext.dart';

class PhoneNumberInput extends StatefulWidget {
  final LoginStore store;

  const PhoneNumberInput({Key key, @required this.store}) : super(key: key);
  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  final prefixController = TextEditingController(text: '05');
  final _countryCodeController = TextEditingController(text: '972');
  final phoneFocus = FocusNode();
  final prefixFocus = FocusNode();
  final countryCodeFocus = FocusNode();

  @override
  void initState() {
    prefixController.selection = TextSelection.fromPosition(
        TextPosition(offset: prefixController.text.length));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inputDecor = const InputDecoration(
      counterText: '',
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: cornflower)),
      border: const UnderlineInputBorder(
        borderSide: const BorderSide(
          width: .3,
          color: cornflower,
        ),
      ),
    );
    return AnimatedPositioned(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 700),
        top: widget.store.isPhoneMode
            ? context.heightPlusStatusbarPerc(.272)
            : context.heightPlusStatusbarPerc(.2),
        child: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            _buildPhone(context, inputDecor, widget.store),
            SizedBox(width: context.widthPx * .04),
            _countryCode(context, inputDecor, widget.store),
          ],
        ));
  }

  Widget _buildPhone(
      BuildContext context, InputDecoration inputDecor, LoginStore store) {
    return Container(
      width: context.widthPx * .39,
      child: TextField(
        autofocus: true,
        focusNode: phoneFocus,
        maxLength: 12,
        textAlign: TextAlign.center,
        decoration: inputDecor.copyWith(
          hintText: '0541122244',
          hintStyle: phoneNumber.copyWith(
            color: whiteOpacity50,
          ),
        ),
        style: phoneNumber.copyWith(
            color: store.isPhoneMode ? white : white.withOpacity(.4)),
        onChanged: (phone) => store.updatePhone(phone),
        keyboardType: TextInputType.phone,
      ),
    );
  }

  Widget _countryCode(
      BuildContext context, InputDecoration inputDecor, LoginStore store) {
    final style = phoneNumber.copyWith(
        color: store.isPhoneMode ? white : white.withOpacity(.4));
    return Container(
      width: context.widthPx * .155,
      child: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: TextField(
          focusNode: countryCodeFocus,
          autofocus: false,
          keyboardType: TextInputType.phone,
          textAlign: TextAlign.center,
          maxLength: 3,
          controller: _countryCodeController,
          maxLengthEnforced: true,
          decoration: inputDecor.copyWith(prefixText: '+', prefixStyle: style),
          style: style,
          onChanged: (countryCode) {
            store.updateCountryCode(countryCode);
            if (countryCode.length == 3) {
              prefixFocus.unfocus();
              FocusScope.of(context).requestFocus(prefixFocus);
            }
          },
        ),
      ),
    );
  }
}
