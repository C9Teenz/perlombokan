import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddItemController extends GetxController {
  RxString selectedValue = ''.obs;
  var image = File('').obs;
  var textImage = ''.obs;

  void updateText(String text) {
    textImage.value = text;
  }

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final selectedImage = await picker.pickImage(source: ImageSource.gallery);
      print(selectedImage.toString());
      if (selectedImage != null) {
        image.value = File(selectedImage.path);
        updateText(image.value.path.split('/').last);
      }
    } catch (e) {
      Get.snackbar("Error", "Something happen $e");
    }
  }
}
