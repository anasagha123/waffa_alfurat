import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiniAgentCard extends StatelessWidget {
  const MiniAgentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Get.height * 0.03),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        height: Get.height * 0.35,
        width: Get.width * 0.2,
        child: Column(
          children: [
            Image.asset(
              "assets/images/waffa_logo.png",
              height: Get.height * 0.1,
            ),
            const Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: Get.height * 0.07,
              child: Text(
                "اسم الوكيل",
                style: Get.textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
