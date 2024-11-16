import 'package:get/get.dart';
import 'package:waffaa_alfurat/controllers/user_controller.dart';
import 'package:waffaa_alfurat/network/remote/http_client.dart';

class PointsController extends GetxController {
  String? points;
  bool isloading = false;

  Future<String> getPoints() async {
    isloading = true;
    update();
    Response response = const Response();

    switch (UserController.userType) {
      case UserType.agent:
        response = await HttpClient.postData(
          path: EndPoints.getAgentPoints,
          body: {
            "agent": UserController.agent.id,
          },
        );
        points = response.body[0]["points"].toString();

        break;
      case UserType.customer:
        response = await HttpClient.postData(
          path: EndPoints.getCustomerPoints,
          body: {
            "customer": UserController.customer.id,
          },
        );
        points = response.body[0]["points"].toString();

        break;
      case UserType.visitor:
        break;
      default:
        throw "ERROR :: User Type error in points controller";
    }

    isloading = false;
    update();
    return points ?? "0";
  }
}
