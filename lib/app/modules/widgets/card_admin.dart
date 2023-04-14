import 'package:flutter/material.dart';

import '../themes/themes.dart';

class CardAdmin extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onclick;
  const CardAdmin({
    super.key,
    required this.title,
    required this.icon,
    this.onclick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: kOrangeColor),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(
              icon,
              color: kOrangeColor,
              size: 50,
            ),
          ),
          Text(
            title,
            style: orangeTextStyle.copyWith(fontWeight: semiBold),
          )
        ],
      ),
    );
  }
}
