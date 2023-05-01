import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:perlombokan/app/data/helper/api_chili.dart';

import 'package:perlombokan/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  RxString token = "".obs;
  var dio = Dio();

  @override
  void onInit() {
    getToken();
    super.onInit();
  }

  Future<void> login(String usermane, String password) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      var response = await dio.post("${ApiChili.userUrl}login",
          data: {'username': usermane, 'password': password});

      String dataToken = response.data['data']['token'];
      prefs.setString("token", dataToken);
      token.value = dataToken;
      if (response.data['status'] == true) {
        Get.offNamed(Routes.home);
      }
    } catch (e) {
      Get.snackbar(
        'User tidak ditemukan',
        'Password atau email salah',
      );
    }
  }

  void getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
  }
}
