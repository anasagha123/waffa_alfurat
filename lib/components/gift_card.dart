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
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.15,
            width: Get.width * 0.4,
            child: Image.network(
              "http://wafaaalfurat.store/storage/${gift.image}",
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
