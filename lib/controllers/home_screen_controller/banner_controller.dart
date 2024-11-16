import 'package:get/get.dart';
import 'package:waffaa_alfurat/network/remote/http_client.dart';

class BannerController extends GetxController {
  bool isloading = false;
  List<String> images = [];

  Future getImages() async {
    isloading = true;
    update();

    images = [];

    Response response = await HttpClient.getData(path: EndPoints.getBanners);

    for (int i = 0; i < response.body.length; i++) {
      images.add(
          "https://wafaaalfurat.store/storage/${response.body[i]["image"]}");
    }
    isloading = false;
    update();
  }
}
