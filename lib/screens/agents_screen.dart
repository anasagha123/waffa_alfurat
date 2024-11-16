import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffaa_alfurat/components/agent_card.dart';
import 'package:waffaa_alfurat/components/my_drawer.dart';
import 'package:waffaa_alfurat/controllers/agents_screen_controller.dart';

class AgentsScreen extends StatelessWidget {
  final AgentsScreenController screenController =
      Get.put(AgentsScreenController());

  AgentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: screenController.getAgents,
            icon: const Icon(
              Icons.refresh_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: GetBuilder<AgentsScreenController>(
          builder: (controller) => Visibility(
            visible: !controller.isloading,
            replacement: const CircularProgressIndicator(),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                vertical: Get.height * 0.1,
                horizontal: Get.width * 0.05,
              ),
              itemBuilder: (ctx, index) => AgentCard(
                agent: controller.agents[index],
              ),
              itemCount: controller.agents.length,
            ),
          ),
        ),
      ),
    );
  }
}
