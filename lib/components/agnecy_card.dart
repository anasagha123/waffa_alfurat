import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgnecyCard extends StatelessWidget {
  const AgnecyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Get.height * 0.03),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        height: Get.height * 0.2,
        width: Get.width * 0.25,
        child: Column(
          children: [
            Image.asset(
              "assets/images/waffa_logo.png",
              height: Get.height * 0.1,
              fit: BoxFit.cover,
            ),
            const Divider(
              color: Colors.black,
            ),
            Text(
              "اسم الوكيل",
              style: Get.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
