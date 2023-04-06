import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perlombokan/app/modules/widgets/category_item.dart';
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
              fit: FlexFit.loose,
              child: SizedBox(
                height: 180,
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
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.blue,
                      child: Text("index: $index"),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
