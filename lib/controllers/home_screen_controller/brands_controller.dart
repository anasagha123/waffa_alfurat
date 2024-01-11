import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:waffat_alfurat/models/brand_model.dart';
import 'package:waffat_alfurat/network/remote/dio_helper.dart';

class BrandsController extends GetxController {
  bool isloading = false;
  List<Brand> brands = [];

  BrandsController();

  Future getBrands() async {
    isloading = true;
    update();

    brands = [];
    Response response = await DioHelper.getData(path: EndPoints.getBrands);

    for (int i = 0; i < response.data.length; i++) {
      brands.add(Brand.fromJson(response.data[i]));
    }

    isloading = false;
    update();
  }
}
