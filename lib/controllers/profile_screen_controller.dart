import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:waffat_alfurat/components/snack_bar.dart';
import 'package:waffat_alfurat/controllers/user_controller.dart';
import 'package:waffat_alfurat/network/remote/dio_helper.dart';

class ProfileScreenController extends GetxController {
  bool isloading = false;

  deleteAccount() async {
    isloading = true;
    update();

    Response resposne = Response(requestOptions: RequestOptions());
    switch (UserController.userType) {
      case UserType.agent:
        resposne = await DioHelper.deleteData(
          path: "${EndPoints.deleteAgent}${UserController.agent.id}",
        );
        break;
      case UserType.customer:
        resposne = await DioHelper.deleteData(
          path: "${EndPoints.deleteCostumer}${UserController.customer.id}",
        );
        break;
      default:
        throw "error user can`t be deleted";
    }

    if (resposne.data["message"] == "تم حذف الحساب بنجاح") {
      showSnackBar(
        message: resposne.data["message"],
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
