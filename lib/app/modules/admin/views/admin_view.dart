import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perlombokan/app/modules/themes/themes.dart';
import 'package:perlombokan/app/modules/widgets/card_admin.dart';
import 'package:perlombokan/app/routes/app_pages.dart';

import '../../widgets/button.dart';
import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 30, right: 16, left: 16, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/haslogin.png"))),
            ),
          ),
          Obx(() => Text(
                controller.userData.value.name,
                style: primaryTextStyle.copyWith(
                    fontWeight: semiBold, fontSize: 30),
              )),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CardAdmin(
                title: "Add Data",
                icon: Icons.add_card_outlined,
                onclick: () {
                  Get.toNamed(Routes.addItem);
                },
              ),
              CardAdmin(
                title: "Home",
                icon: Icons.read_more,
                onclick: () {
                  Get.toNamed(Routes.home);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CardAdmin(title: "Edit Data", icon: Icons.edit_document),
              CardAdmin(title: "Delete Data", icon: Icons.delete_forever),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Button(
                  height: 50,
                  onclick: () {
                    controller.logOut();
                  },
                  text: "Logout",
                  bgColor: kOrangeColor),
            ),
          )
        ],
      ),
    ));
  }
}
