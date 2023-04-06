import 'package:flutter/material.dart';
import 'package:perlombokan/app/modules/themes/themes.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  const CategoryItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 100,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: kGreyColor,
      ),
      child: Center(
        child: Text(
          name,
          style: blackTextStyle.copyWith(fontWeight: bold),
        ),
      ),
    );
  }
}
