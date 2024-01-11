import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:waffat_alfurat/components/delete_user_dialog.dart';
import 'package:waffat_alfurat/components/my_drawer.dart';
import 'package:waffat_alfurat/controllers/points_controller.dart';
import 'package:waffat_alfurat/controllers/profile_screen_controller.dart';
import 'package:waffat_alfurat/controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileScreenController screenController =
      Get.put(ProfileScreenController());
  final PointsController pointsController = Get.put(PointsController());

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/images/default_profile_picture.png",
            height: Get.height * 0.3,
            width: Get.width * 0.4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text("نوع الحساب"),
                  SizedBox(height: Get.height * 0.02),
                  const Text("اسم المستخدم"),
                  SizedBox(height: Get.height * 0.02),
                  const Text("رقم الهاتف"),
                  SizedBox(height: Get.height * 0.02),
                  const Text("العنوان"),
                  SizedBox(height: Get.height * 0.02),
                  const Text("عدد النقاط"),
                ],
              ),
              Column(
                children: [
                  const Text(":"),
                  SizedBox(height: Get.height * 0.02),
                  const Text(":"),
                  SizedBox(height: Get.height * 0.02),
                  const Text(":"),
                  SizedBox(height: Get.height * 0.02),
                  const Text(":"),
                  SizedBox(height: Get.height * 0.02),
                  const Text(":"),
                ],
              ),
              Column(
                children: [
                  Text(
                    UserController.userType == UserType.agent
                        ? "وكيل"
                        : "كهربائي",
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Text(
                    UserController.userType == UserType.agent
                        ? UserController.agent.name!
                        : UserController.customer.name!,
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Text(
                    UserController.userType == UserType.agent
                        ? UserController.agent.phone!
                        : UserController.customer.phone!,
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Text(
                    UserController.userType == UserType.agent
                        ? UserController.agent.address!
                        : UserController.customer.address!,
                  ),
                  SizedBox(height: Get.height * 0.02),
                  GetBuilder<PointsController>(
                    builder: (contorller) => Visibility(
                      visible: !pointsController.isloading,
                      replacement: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: Get.width * 0.15,
                          height: Get.height * 0.02,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black,
                          ),
                        ),
                      ),
                      child: Text(pointsController.points ?? ""),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Center(
            child: GetBuilder<ProfileScreenController>(
              builder: (controller) => Visibility(
                visible: !controller.isloading,
                replacement: const CircularProgressIndicator(),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Get.theme.colorScheme.primary),
                    minimumSize: MaterialStatePropertyAll(
                        Size(Get.width * 0.8, Get.height * 0.06)),
                  ),
                  onPressed: () {
                    Get.dialog(
                      Dialog(
                        child: DeleteUserDialog(),
                      ),
                    );
                  },
                  child: Text(
                    "حذف الحساب",
                    style: Get.textTheme.bodyMedium!.copyWith(
                      color: Get.theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
