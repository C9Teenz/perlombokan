import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perlombokan/app/modules/themes/themes.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            Text(
              "Chilies",
              style: primaryTextStyle.copyWith(fontSize: 54, fontWeight: bold),
            ),
            const SizedBox(
              height: 50,
            ),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
