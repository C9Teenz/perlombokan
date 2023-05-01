import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:perlombokan/app/data/helper/api_chili.dart';
import 'package:perlombokan/app/modules/login/controllers/login_controller.dart';
import 'package:perlombokan/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/user_model.dart';

class AdminController extends GetxController {
  var userData = UserModel(name: "").obs;
  var dio = Dio();
  var loginC = Get.find<LoginController>();

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  Future<Rx<UserModel>> getUser() async {
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer ${loginC.token}";
    try {
      var response = await dio.get(ApiChili.userUrl);
      Map<String, dynamic> data = response.data['data'];
      userData.value = UserModel.fromJson(data);
      return userData;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logOut() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove("token");
      loginC.token.value = "";
      Get.offAllNamed(Routes.home);
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }
}
