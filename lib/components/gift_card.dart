import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffat_alfurat/models/gift_model.dart';

class GiftCard extends StatelessWidget {
  final Gift gift;

  const GiftCard({super.key, required this.gift});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.13,
            child: Image.asset(
              gift.image!,
              width: Get.width * 0.3,
            ),
          ),
          Text(
            "${gift.title}",
            style: Get.textTheme.bodySmall,
          ),
          Text(
            "${gift.points}",
            style: Get.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
