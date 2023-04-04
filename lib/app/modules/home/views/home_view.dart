import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../themes/themes.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, right: 16, left: 16),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 32,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: kGreyColor,
                        labelText: 'Search Some Chilies',
                        prefixIconColor: kBlueColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
