import 'package:get/get.dart';
import 'package:waffaa_alfurat/models/product_model.dart';
import 'package:waffaa_alfurat/network/remote/http_client.dart';

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

    Response response = await HttpClient.getData(path: EndPoints.viewProducts);
    for (int i = 0; i < response.body.length; i++) {
      products.add(Product.fromJson(response.body[i]));
    }

    isloading = false;
    update();
  }
}
