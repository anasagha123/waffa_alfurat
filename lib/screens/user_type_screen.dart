import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffat_alfurat/controllers/user_controller.dart';

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/images/waffa_logo.png",
              height: 270,
            ),
            ElevatedButton(
              onPressed: () {
                UserController.setUserType("agent");
                Get.toNamed("login");
              },
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(300, 100),
                ),
              ),
              child: Text(
                "تسجيل وكيل",
                style: Get.textTheme.bodyMedium,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                UserController.setUserType("customer");

                Get.toNamed("login");
              },
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(300, 100),
                ),
              ),
              child: Text(
                "تسجيل كهربائي",
                style: Get.textTheme.bodyMedium,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                UserController.setUserType("visitor");
                Get.toNamed("home");
              },
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(300, 100),
                ),
              ),
              child: Text(
                "التصفح كزائر",
                style: Get.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
