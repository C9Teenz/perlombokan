import 'package:flutter/material.dart';

import '../themes/themes.dart';

class InputText extends StatelessWidget {
  final String name;
  final TextEditingController nameController;
  const InputText(
      {super.key, required this.name, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: nameController,
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
      ),
    );
  }
}
