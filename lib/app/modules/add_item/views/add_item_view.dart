import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perlombokan/app/modules/home/controllers/home_controller.dart';
import 'package:perlombokan/app/modules/themes/themes.dart';
import 'package:perlombokan/app/modules/widgets/input_text.dart';

import '../controllers/add_item_controller.dart';

class AddItemView extends GetView<AddItemController> {
  const AddItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final homeC = Get.find<HomeController>();

    return Scaffold(
      body: ListView(
        padding:
            const EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 20),
        children: [
          Text(
            "Add Chilies",
            style: orangeTextStyle.copyWith(fontWeight: semiBold, fontSize: 40),
          ),
          const InputText(name: "Name"),
          const InputText(name: "Scientific Name"),
          const InputText(name: "SHU"),
          Obx(
            () => DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Row(
                  children: [
                    Icon(
                      Icons.list,
                      size: 16,
                      color: kOrangeColor,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        'Select Item',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: kOrangeColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: homeC.categ.map<DropdownMenuItem<String>>((element) {
                  return DropdownMenuItem<String>(
                    value: element['id'].toString(),
                    child: Text(
                      element['name'],
                      style: orangeTextStyle.copyWith(fontWeight: bold),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  controller.selectedValue.value = newValue as String;
                },
                value: controller.selectedValue.isEmpty
                    ? null
                    : controller.selectedValue.toString(),
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  width: 160,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: kLightOrangeColor,
                  ),
                  elevation: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
