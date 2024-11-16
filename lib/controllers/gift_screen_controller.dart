import 'package:get/get.dart';
import 'package:waffaa_alfurat/models/gift_model.dart';
import 'package:waffaa_alfurat/network/remote/http_client.dart';

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

    Response response = await HttpClient.getData(path: EndPoints.viewGifts);
    for (int i = 0; i < response.body.length; i++) {
      gifts.add(Gift.fromJson(response.body[i]));
    }

    isloading = false;
    update();
  }
}
