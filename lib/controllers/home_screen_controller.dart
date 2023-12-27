import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  bool isloading = false;

  @override
  onInit() async {
    super.onInit();
    await getData();
  }

  getData() async {
    isloading = true;
    update();
    await Future.delayed(const Duration(seconds: 3));
    isloading = false;
    update();
  }
}
