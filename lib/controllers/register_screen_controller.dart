import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:waffat_alfurat/components/snack_bar.dart';
import 'package:waffat_alfurat/controllers/user_controller.dart';
import 'package:waffat_alfurat/network/remote/dio_helper.dart';

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
      Response response = Response(requestOptions: RequestOptions());

      switch (UserController.userType) {
        case UserType.agent:
          response = await DioHelper.postData(
            path: EndPoints.agentRegister,
            data: {
              "name": name.text,
              "phone": phone.text,
              "address": address.text,
              "password": password.text,
            },
          );
        case UserType.customer:
          response = await DioHelper.postData(
            path: EndPoints.customerRegister,
            data: {
              "name": name.text,
              "phone": phone.text,
              "address": address.text,
              "password": password.text,
            },
          );
        default:
          break;
      }
      if (response.data["message"] == "تم تسجيل الحساب") {
        Get.back();
        showSnackBar(
          message: response.data["message"],
          state: SnackBarState.success,
        );
      } else {
        showSnackBar(
          message: response.data["message"],
          state: SnackBarState.error,
        );
      }
    }

    isloading = false;
    update();
  }
}
