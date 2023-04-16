import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../themes/themes.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/rawitmerah.jpg"),
              fit: BoxFit.cover),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: const EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            kWhiteColor.withOpacity(0),
            kBlackColor.withOpacity(0.95)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
      );
    }

    Widget content() {
      return SizedBox(
        width: double.infinity,
        // margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            //NOTE: LOGO
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 24,
                width: 50,
                margin: const EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/fire.png'),
                  ),
                ),
              ),
            ),
            //NOTE: NAME DESTINATION
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 256),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "destination.name",
                          style: whiteTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                        ),
                        Text(
                          "destination.city",
                          style: whiteTextStyle.copyWith(
                              fontSize: 16, fontWeight: light),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.only(right: 2),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/fire.png'),
                          ),
                        ),
                      ),
                      Text(
                        "4",
                        style: whiteTextStyle.copyWith(fontWeight: medium),
                      )
                    ],
                  ),
                ],
              ),
            ),
            //NOTE: ABOUT
            Container(
              width: double.infinity,
              height: 446,
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: blackTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                    style: blackTextStyle.copyWith(
                        fontWeight: regular, height: 1.9),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [backgroundImage(), customShadow(), content()],
        ),
      ),
    ));
  }
}
