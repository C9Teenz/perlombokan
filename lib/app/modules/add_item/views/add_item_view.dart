import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perlombokan/app/modules/home/controllers/home_controller.dart';
import 'package:perlombokan/app/modules/themes/themes.dart';
import 'package:perlombokan/app/modules/widgets/button.dart';
import 'package:perlombokan/app/modules/widgets/input_desc.dart';
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
          InputText(name: "Name", nameController: controller.nameC),
          InputText(
            name: "Scientific Name",
            nameController: controller.scientificC,
          ),
          InputText(
            name: "SHU",
            nameController: controller.shuC,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Expanded(
                  child: Obx(() => TextFormField(
                        controller: controller.imageC.value,
                        onChanged: (newvalue) {
                          controller.updateText(newvalue);
                        },
                        decoration: InputDecoration(
                            focusColor: kOrangeColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: kLightOrangeColor,
                            hintText: 'Choose an image',
                            hintStyle: orangeTextStyle),
                      )),
                ),
                IconButton(
                  icon: const Icon(Icons.image),
                  onPressed: () {
                    controller.getImage();
                  },
                ),
              ],
            ),
          ),
          Obx(
            () => Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: DropdownButtonHideUnderline(
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
          ),
          InputDesc(
            desc: "Description",
            descC: controller.descC,
          ),
          Button(
              height: 50,
              onclick: () {
                if (controller.nameC.text.isEmpty ||
                    controller.imageC.value.text.isEmpty ||
                    controller.scientificC.text.isEmpty ||
                    controller.shuC.text.isEmpty ||
                    controller.descC.text.isEmpty) {
                  Get.snackbar("Failed", "Make sure input field is not empety");
                } else {
                  controller.addChilie();
                }
                //  print(controller.textImage.value);
              },
              text: "Add Chilie",
              bgColor: kRedColor)
        ],
      ),
    );
  }
}
