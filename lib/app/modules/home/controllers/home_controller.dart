import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:perlombokan/app/data/helper/api_chili.dart';
import 'package:perlombokan/app/data/models/chili_model.dart';

class HomeController extends GetxController {
  var chiliesData = <ChiliModel>[].obs;
  final dio = Dio();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<List<ChiliModel>> getData() async {
    try {
      var result = await dio.get(ApiChili.baseUrl);
      final List data = result.data['data'];
      chiliesData.value = data.map((e) => ChiliModel.fromJson(e)).toList();
      return chiliesData;
    } catch (e) {
      rethrow;
    }
  }
}
