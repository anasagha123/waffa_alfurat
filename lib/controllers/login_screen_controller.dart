import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffaa_alfurat/components/snack_bar.dart';
import 'package:waffaa_alfurat/controllers/user_controller.dart';
import 'package:waffaa_alfurat/models/agent_model.dart';
import 'package:waffaa_alfurat/models/customer_model.dart';
import 'package:waffaa_alfurat/network/remote/http_client.dart';
import 'package:waffaa_alfurat/network/remote/firebase_api.dart';

class LoginScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  bool isloading = false;

  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  login() async {
    isloading = true;
    Response response = const Response();
    update();
    if (formKey.currentState!.validate()) {
      switch (UserController.userType) {
        case UserType.agent:
          response = await HttpClient.postData(
            path: EndPoints.agentLogin,
            body: {
              "phone": phone.text,
              "password": password.text,
            },
          );
          if (response.body["message"] == "تم تسجيل الدخول بنجاح" &&
              response.body["agent"]["active"] == "yes") {
            UserController.agent = Agent.fromJson(response.body["agent"]);

            UserController.setUserType("agent");
            UserController.setUser(response.body);

            showSnackBar(
              message: response.body["message"],
              state: SnackBarState.success,
            );
            await FirebaseApi().initNotifications();
            Get.toNamed("home");
          } else {
            showSnackBar(
              message: response.body["message"],
              state: SnackBarState.error,
            );
          }
          break;
        case UserType.customer:
          response = await HttpClient.postData(
            path: EndPoints.customerLogin,
            body: {
              "phone": phone.text,
              "password": password.text,
            },
          );

          if (response.body["message"] == "تم تسجيل الدخول بنجاح" &&
              response.body["customer"]["active"] == "yes") {
            UserController.customer =
                Customer.fromJson(response.body["customer"]);
            UserController.setUserType("customer");
            UserController.setUser(response.body);

            showSnackBar(
              message: response.body["message"],
              state: SnackBarState.success,
            );
            Get.toNamed("home");
          } else {
            showSnackBar(
              message: response.body["message"],
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
