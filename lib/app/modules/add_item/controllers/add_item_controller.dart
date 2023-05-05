import 'dart:io';

import 'package:dio/dio.dart' as datas;
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:perlombokan/app/data/helper/api_chili.dart';
import 'package:perlombokan/app/modules/home/controllers/home_controller.dart';
import 'package:perlombokan/app/routes/app_pages.dart';

class AddItemController extends GetxController {
  final TextEditingController nameC = TextEditingController();
  final TextEditingController scientificC = TextEditingController();
  final TextEditingController shuC = TextEditingController();
  final TextEditingController descC = TextEditingController();
  var imageC = TextEditingController().obs;
  HomeController homeC = Get.find();
  RxString selectedValue = ''.obs;
  var image = File('').obs;
  var textImage = ''.obs;
  final dio = datas.Dio();
  updateText(String text) {
    textImage.value = text;
    return imageC.value.text = text;
  }

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final selectedImage = await picker.pickImage(source: ImageSource.gallery);

      if (selectedImage != null) {
        image.value = File(selectedImage.path);
        updateText(image.value.path.split('/').last);
      }
    } catch (e) {
      Get.snackbar("Error", "Something happen $e");
    }
  }

  Future<void> addChilie() async {
    try {
      var dataUpload = datas.FormData.fromMap({
        'name': nameC.text,
        'categoryId': int.parse(selectedValue.value),
        'scientificName': scientificC.text,
        'shu': shuC.text,
        'image': await datas.MultipartFile.fromFile(image.value.path,
            filename: textImage.value),
        'description': descC.text
      });

      var response =
          await dio.post("${ApiChili.baseUrl}create", data: dataUpload);
      if (response.statusCode == 200) {
        homeC.getData().then((value) => Get.offNamed(Routes.home));
      }
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }
}
