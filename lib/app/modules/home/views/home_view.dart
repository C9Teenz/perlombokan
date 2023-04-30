import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perlombokan/app/modules/login/controllers/login_controller.dart';
import 'package:perlombokan/app/modules/widgets/card_item.dart';
import 'package:perlombokan/app/modules/widgets/category_item.dart';
import 'package:perlombokan/app/routes/app_pages.dart';
import '../../themes/themes.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final auth = Get.put(LoginController());
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, right: 16, left: 16, bottom: 20),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        InkWell(
                          onTap: () {
                            (auth.token.isEmpty)
                                ? Get.toNamed(Routes.login)
                                : Get.toNamed(Routes.admin);
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      (auth.token.isEmpty)
                                          ? 'assets/images/notlogin.png'
                                          : 'assets/images/haslogin.png',
                                    ),
                                    fit: BoxFit.contain)),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 45,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (value) => controller.findChilies(value),
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                            hintText: "Search some chilies",
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
                            prefixIconColor: kBlueColor),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 30,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          CategoryItem(
                            name: "All Chilies",
                          ),
                          CategoryItem(
                            name: "Cayenne",
                          ),
                          CategoryItem(
                            name: "Red Chilies",
                          ),
                          CategoryItem(
                            name: "Green Chilies",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(),
                  child: Obx(() {
                    if (controller.chiliesData.isEmpty &&
                        controller.filterName.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (controller.filterName.isNotEmpty) {
                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: controller.filterName.length,
                        itemBuilder: (context, index) {
                          final double heightCon = height * 1 / 8;
                          final double heightC = (heightCon * 3) / 2.3;
                          return CardItem(
                            heightContainer: heightCon,
                            heightC: heightC,
                            image: controller.filterName[index].image,
                            name: controller.filterName[index].name,
                            scientistName:
                                controller.filterName[index].scientificName,
                          );
                        },
                      );
                    } else {
                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: controller.chiliesData.length,
                        itemBuilder: (context, index) {
                          final double heightCon = height * 1 / 8;
                          final double heightC = (heightCon * 3) / 2.3;
                          return CardItem(
                            heightContainer: heightCon,
                            heightC: heightC,
                            image: controller.chiliesData[index].image,
                            name: controller.chiliesData[index].name,
                            scientistName:
                                controller.chiliesData[index].scientificName,
                          );
                        },
                      );
                    }
                  }),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
