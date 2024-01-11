import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:waffat_alfurat/models/agent_model.dart';
import 'package:waffat_alfurat/screens/%D9%90agent_detailes_screen.dart';

class AgentCard extends StatelessWidget {
  final Agent agent;
  const AgentCard({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Get.height * 0.03),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(-5, 15),
              blurRadius: 5,
            ),
          ],
        ),
        height: Get.height * 0.3,
        width: Get.width * 0.9,
        child: Column(
          children: [
            agent.image == null
                ? Image.asset(
                    "assets/images/waffa_logo.png",
                    height: Get.height * 0.2,
                    fit: BoxFit.fill,
                  )
                : Image.network(
                    "https://wafaaalfurat.store/storage/${agent.image}",
                    height: Get.height * 0.2,
                    fit: BoxFit.fill,
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
                    "${agent.name}",
                    style: Get.textTheme.bodyMedium,
                  ),
                  SizedBox(
                    width: Get.width * 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () async {
                            Uri uri = Uri.parse("tel:${agent.phone}");
                            if (!await launchUrl(uri)) {
                              throw Exception(
                                  'Could not launch tel:${agent.phone}');
                            }
                          },
                          icon: const Icon(
                            Icons.phone_outlined,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            Uri uri =
                                Uri.parse("https://wa.me/+964${agent.phone}");
                            if (!await launchUrl(uri)) {
                              throw Exception(
                                  'Could not launch https://wa.me/+964${agent.phone}');
                            }
                          },
                          icon: const Icon(
                            Icons.chat_outlined,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.1,
                          width: Get.width * 0.08,
                          child: PopupMenuButton(
                            itemBuilder: (ctx) => [
                              PopupMenuItem(
                                child: TextButton(
                                  child: const Text("التفاصيل"),
                                  onPressed: () {
                                    Get.to(AgentDetailsScreen(
                                      agent: agent,
                                    ));
                                  },
                                ),
                              ),
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
