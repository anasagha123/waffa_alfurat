import 'package:get/get.dart';
import 'package:waffaa_alfurat/components/snack_bar.dart';
import 'package:waffaa_alfurat/controllers/user_controller.dart';
import 'package:waffaa_alfurat/network/remote/http_client.dart';

class ProfileScreenController extends GetxController {
  bool isloading = false;

  deleteAccount() async {
    isloading = true;
    update();

    Response resposne = const Response();
    switch (UserController.userType) {
      case UserType.agent:
        resposne = await HttpClient.deleteData(
          path: "${EndPoints.deleteAgent}${UserController.agent.id}",
        );
        break;
      case UserType.customer:
        resposne = await HttpClient.deleteData(
          path: "${EndPoints.deleteCostumer}${UserController.customer.id}",
        );
        break;
      default:
        throw "error user can`t be deleted";
    }

    if (resposne.body["message"] == "تم حذف الحساب بنجاح") {
      showSnackBar(
        message: resposne.body["message"],
        state: SnackBarState.success,
      );
      UserController.logOut();
    } else {
      showSnackBar(
        message: "حدث خطأ في الاتصال",
        state: SnackBarState.error,
      );
    }

    isloading = false;
    update();
  }
}
