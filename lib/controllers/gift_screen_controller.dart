import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:waffat_alfurat/models/gift_model.dart';
import 'package:waffat_alfurat/network/remote/dio_helper.dart';

class GiftScreenController extends GetxController {
  bool isloading = false;
  List<Gift> gifts = [];

  GiftScreenController() {
    getGifts();
  }

  Future getGifts() async {
    isloading = true;
    update();

    gifts = [];

    Response response = await DioHelper.getData(path: EndPoints.viewGifts);
    for (int i = 0; i < response.data.length; i++) {
      gifts.add(Gift.fromJson(response.data[i]));
    }

    isloading = false;
    update();
  }
}
