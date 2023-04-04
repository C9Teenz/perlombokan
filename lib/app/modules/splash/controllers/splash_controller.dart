import 'dart:async';

import 'package:get/get.dart';
import 'package:perlombokan/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () => Get.offNamed(Routes.home));
    super.onInit();
  }
}
