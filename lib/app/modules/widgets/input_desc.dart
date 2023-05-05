import 'package:flutter/material.dart';

import '../themes/themes.dart';

class InputDesc extends StatelessWidget {
  final String desc;
  final TextEditingController descC;
  const InputDesc({super.key, required this.desc, required this.descC});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        minLines: 3,
        maxLines: 6,
        controller: descC,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          focusColor: kOrangeColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: kLightOrangeColor,
          labelText: desc,
          labelStyle: orangeTextStyle.copyWith(fontWeight: bold),
        ),
      ),
    );
  }
}
