import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffat_alfurat/components/default_text_form_field.dart';
import 'package:waffat_alfurat/controllers/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  final screenController = Get.put(LoginScreenController());
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: Get.height * 0.05),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const BackButton(),
                        ),
                        SizedBox(width: Get.width * 0.05),
                        Text(
                          "تسجيل الدخول",
                          style: Get.textTheme.bodyMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: Get.height * 0.85,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      Image.asset(
                        "assets/images/Tablet login-bro.png",
                        height: Get.height * 0.3,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                        child: Form(
                          key: screenController.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "رقم الهاتف",
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              DefaultTextFormField(
                                iconData: Icons.phone,
                                hintText: "XXXXXXXXXX",
                                textEditingController: screenController.phone,
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              const Text("كلمة المرور"),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              DefaultTextFormField(
                                iconData: Icons.lock,
                                hintText: "XXXXXXXXXX",
                                isObscured: true,
                                textEditingController:
                                    screenController.password,
                              ),
                              SizedBox(
                                height: Get.height * 0.05,
                              ),
                              Center(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Get.theme.colorScheme.primary),
                                    minimumSize: MaterialStatePropertyAll(Size(
                                        Get.width * 0.8, Get.height * 0.06)),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "تسجيل الدخول",
                                    style: Get.textTheme.bodyMedium!.copyWith(
                                      color: Get.theme.colorScheme.onPrimary,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "ليس لديك حساب بعد ؟",
                                    style: Get.textTheme.bodySmall,
                                  ),
                                  TextButton(
                                    child: Text("حساب جديد"),
                                    onPressed: () {
                                      Get.toNamed("register");
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
