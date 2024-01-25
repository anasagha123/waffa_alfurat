// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffat_alfurat/models/agent_model.dart';

class AgentDetailsScreen extends StatelessWidget {
  final Agent agent;
  const AgentDetailsScreen({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            agent.image == null
                ? Image.asset(
                    "assets/images/waffa_logo.png",
                    height: Get.height * 0.3,
                    width: Get.width,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    "https://wafaaalfurat.store/storage/${agent.image}",
                    height: Get.height * 0.3,
                    width: Get.width,
                    fit: BoxFit.cover,
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text("الاسم"),
                    SizedBox(height: Get.height * 0.02),
                    const Text("الجوال"),
                    SizedBox(height: Get.height * 0.02),
                    const Text("العنوان"),
                  ],
                ),
                Column(
                  children: [
                    const Text(":"),
                    SizedBox(height: Get.height * 0.02),
                    const Text(":"),
                    SizedBox(height: Get.height * 0.02),
                    const Text(":"),
                  ],
                ),
                Column(
                  children: [
                    Text("${agent.name}"),
                    SizedBox(height: Get.height * 0.02),
                    Text("${agent.phone}"),
                    SizedBox(height: Get.height * 0.02),
                    Text("${agent.address}"),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
