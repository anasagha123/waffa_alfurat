import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:waffat_alfurat/network/remote/dio_helper.dart';

class BannerController extends GetxController {
  bool isloading = false;
  List<String> images = [];

  Future getImages() async {
    isloading = true;
    update();

    images = [];

    Response response = await DioHelper.getData(path: EndPoints.getBanners);

    for (int i = 0; i < response.data.length; i++) {
      images.add(
          "https://wafaaalfurat.store/storage/${response.data[i]["image"]}");
    }
    isloading = false;
    update();
  }
}
