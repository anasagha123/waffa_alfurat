import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffaa_alfurat/components/snack_bar.dart';
import 'package:waffaa_alfurat/controllers/user_controller.dart';
import 'package:waffaa_alfurat/network/remote/http_client.dart';

class RegisterScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  bool isloading = false;

  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController repeatPassword = TextEditingController();

  String? isFieldEmpty(String? val) {
    if (val!.isEmpty) return "لا يمكن ترك الحقل خاليا";
    return null;
  }

  String? passwordValidation(String? val) {
    if (password.text != repeatPassword.text) return "كلمات المرور غير متطابقة";
    if (val!.length < 8) return "يجب ان تتكون كلمة المرورمن 8 محارف على الاقل";
    return null;
  }

  String? phoneValidation(String? val) {
    if (val!.length != 11) return "يجب ان يتكون الرقم من 11 خانة";
    return null;
  }

  register() async {
    isloading = true;
    update();
    if (formKey.currentState!.validate()) {
      Response response = const Response();

      switch (UserController.userType) {
        case UserType.agent:
          response = await HttpClient.postData(
            path: EndPoints.agentRegister,
            body: {
              "name": name.text,
              "phone": phone.text,
              "address": address.text,
              "password": password.text,
            },
          );
        case UserType.customer:
          response = await HttpClient.postData(
            path: EndPoints.customerRegister,
            body: {
              "name": name.text,
              "phone": phone.text,
              "address": address.text,
              "password": password.text,
            },
          );
        default:
          break;
      }
      if (response.body["message"] == " تم تسجيل الحساب انتظر موافقة الشركة") {
        Get.back();
        showSnackBar(
          message: response.body["message"],
          state: SnackBarState.success,
        );
      } else {
        showSnackBar(
          message: response.body["message"],
          state: SnackBarState.error,
        );
      }
    }

    isloading = false;
    update();
  }
}
