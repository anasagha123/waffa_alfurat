import 'package:get/get.dart';
import 'package:waffaa_alfurat/models/brand_model.dart';
import 'package:waffaa_alfurat/network/remote/http_client.dart';

class BrandsController extends GetxController {
  bool isloading = false;
  List<Brand> brands = [];

  Future getBrands() async {
    isloading = true;
    update();

    brands = [];
    Response response = await HttpClient.getData(path: EndPoints.getBrands);

    for (int i = 0; i < response.body.length; i++) {
      brands.add(Brand.fromJson(response.body[i]));
    }

    isloading = false;
    update();
  }
}
