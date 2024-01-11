import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:waffat_alfurat/components/snack_bar.dart';
import 'package:waffat_alfurat/controllers/user_controller.dart';
import 'package:waffat_alfurat/models/agent_model.dart';
import 'package:waffat_alfurat/models/customer_model.dart';
import 'package:waffat_alfurat/network/remote/dio_helper.dart';

class LoginScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  bool isloading = false;

  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  login() async {
    isloading = true;
    Response response = Response(requestOptions: RequestOptions());
    update();
    if (formKey.currentState!.validate()) {
      switch (UserController.userType) {
        case UserType.agent:
          response = await DioHelper.postData(
            path: EndPoints.agentLogin,
            data: {
              "phone": phone.text,
              "password": password.text,
            },
          );
          if (response.data["message"] == "تم تسجيل الدخول بنجاح" &&
              response.data["agent"]["active"] == "yes") {
            UserController.agent = Agent.fromJson(response.data["agent"]);

            UserController.setUserType("agent");
            UserController.setUser(response.data);

            showSnackBar(
              message: response.data["message"],
              state: SnackBarState.success,
            );
            Get.toNamed("home");
          } else {
            showSnackBar(
              message: response.data["message"],
              state: SnackBarState.error,
            );
          }
          break;
        case UserType.customer:
          response = await DioHelper.postData(
            path: EndPoints.customerLogin,
            data: {
              "phone": phone.text,
              "password": password.text,
            },
          );

          if (response.data["message"] == "تم تسجيل الدخول بنجاح" &&
              response.data["customer"]["active"] == "yes") {
            UserController.customer =
                Customer.fromJson(response.data["customer"]);
            UserController.setUserType("customer");
            UserController.setUser(response.data);

            showSnackBar(
              message: response.data["message"],
              state: SnackBarState.success,
            );
            Get.toNamed("home");
          } else {
            showSnackBar(
              message: response.data["message"],
              state: SnackBarState.error,
            );
          }
          break;

        default:
          break;
      }
    }
    isloading = false;
    update();
  }

  gotoRegister() {
    Get.toNamed("register");
  }
}
