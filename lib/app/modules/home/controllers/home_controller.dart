import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:perlombokan/app/data/helper/api_chili.dart';
import 'package:perlombokan/app/data/models/category_model.dart';
import 'package:perlombokan/app/data/models/chili_model.dart';

class HomeController extends GetxController {
  var chiliesData = <ChiliModel>[].obs;
  var filterName = <ChiliModel>[].obs;
  List<CategoryModel> categoryData = <CategoryModel>[].obs;
  var categ = [].obs;

  final dio = Dio();

  @override
  void onInit() {
    getData();
    getCategory();
    super.onInit();
  }

  Future<List<CategoryModel>> getCategory() async {
    try {
      var response = await dio.get(ApiChili.categoryUrl);
      if (response.statusCode == 200) {
        final List<dynamic> result = response.data;
        categ.value = result;
        categoryData = result.map((e) => CategoryModel.fromJson(e)).toList();
      }
      return categoryData;
    } catch (e) {
      Get.snackbar('Error', "something wrong $e");
      rethrow;
    }
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

  void findChilies(String name) {
    try {
      List<ChiliModel> result = [];
      if (name.isEmpty) {
        result = chiliesData;
      } else {
        result = chiliesData
            .where((e) => e.name.toLowerCase().contains(name.toLowerCase()))
            .toList();
      }

      filterName.value = result;
    } catch (e) {
      rethrow;
    }
  }
}
