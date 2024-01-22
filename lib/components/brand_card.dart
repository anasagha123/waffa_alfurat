import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffat_alfurat/models/brand_model.dart';

class BrandCard extends StatelessWidget {
  final Brand brand;
  const BrandCard({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(-10, 10),
            blurRadius: 5,
          ),
        ],
      ),
      height: Get.height * 0.2,
      width: Get.width * 0.25,
      child: Column(
        children: [
          Image.network(
            "${brand.image}",
            height: Get.height * 0.12,
            fit: BoxFit.fill,
          ),
          Divider(
            color: Colors.black,
            indent: Get.width * 0.03,
            endIndent: Get.width * 0.03,
          ),
          Text(
            "${brand.name}",
            style: Get.textTheme.bodySmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
