import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:waffat_alfurat/controllers/user_controller.dart';
import 'package:waffat_alfurat/network/remote/dio_helper.dart';

class PointsController extends GetxController {
  String? points;
  bool isloading = false;

  PointsController() {
    getPoints();
  }

  getPoints() async {
    isloading = true;
    update();
    Response response = Response(requestOptions: RequestOptions());

    switch (UserController.userType) {
      case UserType.agent:
        response = await DioHelper.postData(
          path: EndPoints.getAgentPoints,
          data: {
            "agent": UserController.agent.id,
          },
        );
        points = response.data[0]["points"].toString();

        break;
      case UserType.customer:
        response = await DioHelper.postData(
          path: EndPoints.getCustomerPoints,
          data: {
            "customer": UserController.customer.id,
          },
        );
        points = response.data[0]["points"].toString();

        break;
      case UserType.visitor:
        break;
      default:
        throw "ERROR :: User Type error in points controller";
    }

    isloading = false;
    update();
  }
}
