import 'package:flutter/material.dart';

import '../themes/themes.dart';

class InputText extends StatelessWidget {
  final String name;
  const InputText({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        focusColor: kOrangeColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: kLightOrangeColor,
        labelText: name,
        labelStyle: orangeTextStyle.copyWith(fontWeight: bold),
      ),
    );
  }
}
