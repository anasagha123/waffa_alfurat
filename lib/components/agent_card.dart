import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgentCard extends StatelessWidget {
  const AgentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Get.height * 0.03),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        height: Get.height * 0.3,
        width: Get.width * 0.9,
        child: Column(
          children: [
            Image.asset(
              "assets/images/waffa_logo.png",
              height: Get.height * 0.2,
            ),
            const Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: Get.height * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "اسم الوكيل",
                    style: Get.textTheme.bodySmall,
                  ),
                  SizedBox(
                    width: Get.width * 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.phone_outlined,
                        ),
                        Icon(
                          Icons.chat_outlined,
                        ),
                        SizedBox(
                          height: Get.height * 0.1,
                          width: Get.width * 0.08,
                          child: PopupMenuButton(
                            itemBuilder: (ctx) => [
                              PopupMenuItem(child: Text("data")),
                              PopupMenuItem(child: Text("data")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
