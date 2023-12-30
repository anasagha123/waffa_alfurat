import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:waffat_alfurat/models/product_model.dart';
import 'package:waffat_alfurat/network/remote/dio_helper.dart';

class ProductScreenController extends GetxController {
  bool isloading = false;
  List<Product> products = [];

  ProductScreenController() {
    getProducts();
  }

  Future getProducts() async {
    isloading = true;
    update();

    products = [];

    Response response = await DioHelper.getData(path: EndPoints.viewProducts);
    for (int i = 0; i < response.data.length; i++) {
      products.add(Product.fromJson(response.data[i]));
    }

    print(response.data.toString());
    print("PRODUCTS::" + products.toString());

    isloading = false;
    update();
  }
}
