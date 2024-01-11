import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffat_alfurat/models/gift_model.dart';

class GiftCard extends StatelessWidget {
  final Gift gift;

  const GiftCard({super.key, required this.gift});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(-10, 20),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.16,
            width: Get.width * 0.45,
            child: Image.network(
              "https://wafaaalfurat.store/storage/${gift.image}",
              fit: BoxFit.cover,
            ),
          ),
          Divider(height: Get.height * 0.008),
          Text(
            "${gift.title}",
            style: Get.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Get.height * 0.01),
          Text(
            "${gift.points} نقطة",
            style: Get.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
