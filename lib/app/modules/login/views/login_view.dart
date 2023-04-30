import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../widgets/button.dart';

import '../../themes/themes.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController userC = TextEditingController();
    final TextEditingController passC = TextEditingController();
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30, right: 16, left: 16, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/fire.png'))),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Perlom',
                    style: primaryTextStyle.copyWith(
                        fontSize: 34, fontWeight: bold),
                    children: [
                      TextSpan(
                          text: "bokan",
                          style: orangeTextStyle.copyWith(
                              fontSize: 34, fontWeight: bold))
                    ],
                  ),
                ),
              ],
            ),
            Text(
              "Please enter your \nusername and password",
              style: greyTextStyle.copyWith(fontWeight: semiBold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: userC,
                decoration: InputDecoration(
                    focusColor: kOrangeColor,
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      size: 28,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: kLightOrangeColor,
                    labelText: 'Enter Your Username',
                    labelStyle: greyTextStyle.copyWith(fontWeight: bold),
                    prefixIconColor: kOrangeColor),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: passC,
                obscureText: true,
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.remove_red_eye_rounded),
                    focusColor: kOrangeColor,
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      size: 28,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: kLightOrangeColor,
                    labelText: 'Enter Your Password',
                    labelStyle: greyTextStyle.copyWith(fontWeight: bold),
                    prefixIconColor: kOrangeColor),
              ),
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Button(
                      height: 50,
                      onclick: () {
                        controller.login(userC.text, passC.text);
                      },
                      text: "Login",
                      bgColor: kOrangeColor)),
            )
          ],
        ),
      ),
    );
  }
}
