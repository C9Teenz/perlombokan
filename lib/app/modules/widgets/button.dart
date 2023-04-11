import "package:flutter/material.dart";
import "package:perlombokan/app/modules/themes/themes.dart";

class Button extends StatelessWidget {
  final double height;
  final double width;
  final Function() onclick;
  final String text;
  final Color bgColor;

  const Button(
      {super.key,
      required this.height,
      this.width = double.infinity,
      required this.onclick,
      required this.text,
      required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: onclick,
        style: TextButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        child: Text(
          text,
          style: whiteTextStyle.copyWith(fontWeight: semiBold),
        ),
      ),
    );
  }
}
