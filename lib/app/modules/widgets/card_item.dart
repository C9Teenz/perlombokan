import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perlombokan/app/modules/themes/themes.dart';
import 'package:perlombokan/app/routes/app_pages.dart';

class CardItem extends StatelessWidget {
  final double heightContainer;
  final double heightC;
  const CardItem({super.key, this.heightContainer = 300, this.heightC = 200});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.detail),
      child: Container(
        height: heightContainer,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: kOrangeColor),
            borderRadius: BorderRadius.circular(9),
            color: kWhiteColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: heightC,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(9),
                  topRight: Radius.circular(9),
                ),
                image: DecorationImage(
                    image: AssetImage("assets/images/rawitmerah.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rawit Merah',
                    style: primaryTextStyle.copyWith(
                        fontWeight: bold, fontSize: 14),
                  ),
                  Text(
                    "Capsicum frutescens",
                    style: greyTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 12),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
