import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perlombokan/app/modules/themes/themes.dart';
import 'package:perlombokan/app/modules/widgets/input_text.dart';

import '../controllers/add_item_controller.dart';

class AddItemView extends GetView<AddItemController> {
  const AddItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding:
            const EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 20),
        children: [
          Text(
            "Add Chilies",
            style: orangeTextStyle.copyWith(fontWeight: semiBold, fontSize: 40),
          ),
          const InputText(name: "Name")
        ],
      ),
    );
  }
}
