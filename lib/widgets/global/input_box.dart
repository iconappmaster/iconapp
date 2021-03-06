import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/language/language_store.dart';

import 'custom_text.dart';

class InputText extends StatelessWidget {
  final String initialValue;
  final String title;
  final Function(String) onChange;
  final TextInputType keyboardType;
  final int maxLength;
  final FormFieldValidator<String> validator;
  final String hint;
  final TextStyle hintStyle;
  final TextStyle textStyle;
  final EdgeInsets contentPadding;

  const InputText({
    Key key,
    this.title,
    @required this.onChange,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.validator,
    this.hint,
    this.hintStyle,
    this.textStyle = fieldInput,
    this.initialValue,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: cornflower,
          width: 1.0,
        ));
    return Directionality(
      textDirection: language.isLTR ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (title != null) Center(child: CustomText(title, style: fieldLabel)),
          TextFormField(
            key: key,
            initialValue: initialValue,
            validator: validator,
            maxLength: maxLength,
            textAlign: language.textAlign,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              contentPadding: contentPadding,
              hintStyle: hintStyle,
              hintText: hint,
              counterText: '',
              enabledBorder: border,
              border: border,
            ),
            onChanged: onChange,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
