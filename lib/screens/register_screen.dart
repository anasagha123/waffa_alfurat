import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffaa_alfurat/components/default_form_field_2.dart';
import 'package:waffaa_alfurat/controllers/register_screen_controller.dart';

class RegisterScreen extends StatelessWidget {
  final screenController = Get.put(RegisterScreenController());

  RegisterScreen({super.key});

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
                          "حساب جديد",
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
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                        child: Form(
                          key: screenController.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "الاسم",
                              ),
                              SizedBox(
                                height: Get.height * 0.005,
                              ),
                              DefaultTextFormField2(
                                hintText: "ادخل الاسم الكامل",
                                textInputType: TextInputType.name,
                                textEditingController: screenController.name,
                                validator: screenController.isFieldEmpty,
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              const Text("رقم الهاتف"),
                              SizedBox(
                                height: Get.height * 0.005,
                              ),
                              DefaultTextFormField2(
                                hintText: "ادخل رقم الهاتف",
                                textInputType: TextInputType.number,
                                textDirection: TextDirection.ltr,
                                textEditingController: screenController.phone,
                                validator: screenController.phoneValidation,
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              const Text("العنوان"),
                              SizedBox(
                                height: Get.height * 0.005,
                              ),
                              DefaultTextFormField2(
                                hintText: "ادخل العنوان",
                                textEditingController: screenController.address,
                                validator: screenController.isFieldEmpty,
                              ),
                              const Text("كلمة المرور"),
                              SizedBox(
                                height: Get.height * 0.005,
                              ),
                              DefaultTextFormField2(
                                hintText: "ادخل كلمة المرور",
                                isObsecure: true,
                                textInputType: TextInputType.visiblePassword,
                                textEditingController:
                                    screenController.password,
                                validator: screenController.passwordValidation,
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              const Text("تأكيد كلمة المرور"),
                              SizedBox(
                                height: Get.height * 0.005,
                              ),
                              DefaultTextFormField2(
                                hintText: "تأكيد كلمة المرور",
                                isObsecure: true,
                                textEditingController:
                                    screenController.repeatPassword,
                                validator: screenController.passwordValidation,
                              ),
                              SizedBox(
                                height: Get.height * 0.05,
                              ),
                              Center(
                                child: GetBuilder<RegisterScreenController>(
                                  builder: (controller) => Visibility(
                                    visible: !controller.isloading,
                                    replacement:
                                        const CircularProgressIndicator(),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Get.theme.colorScheme.primary),
                                        minimumSize: MaterialStatePropertyAll(
                                            Size(Get.width * 0.8,
                                                Get.height * 0.06)),
                                      ),
                                      onPressed: controller.register,
                                      child: Text(
                                        "انشاء الحساب",
                                        style:
                                            Get.textTheme.bodyMedium!.copyWith(
                                          color:
                                              Get.theme.colorScheme.onPrimary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
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
