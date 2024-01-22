import 'package:get/get.dart';
import 'package:waffat_alfurat/controllers/user_controller.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    if (UserController.userType == UserType.none) {
      Future.delayed(const Duration(milliseconds: 3000), () {
        Get.offAllNamed("userType");
        print("USERTYPE SCREEN");
      });
    } else {
      Future.delayed(const Duration(milliseconds: 3000), () {
        Get.offAllNamed("home");
        print("HOME SCREEN");
      });
    }
  }
}
