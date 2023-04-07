import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perlombokan/app/modules/widgets/card_item.dart';
import 'package:perlombokan/app/modules/widgets/category_item.dart';
import '../../themes/themes.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30, right: 16, left: 16, bottom: 20),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: SizedBox(
                height: 180,
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
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/notlogin.png',
                                  ),
                                  fit: BoxFit.contain)),
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
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    final double heightCon = height * 1 / 8;
                    final double heightC = (heightCon * 3) / 2.3;
                    return CardItem(
                      heightContainer: heightCon,
                      heightC: heightC,
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
