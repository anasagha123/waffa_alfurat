import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffat_alfurat/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

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
              product.image!,
              width: Get.width * 0.3,
            ),
          ),
          Text(
            "${product.title}",
            style: Get.textTheme.bodySmall,
          ),
          Text(
            "${product.price} د.ع",
            style: Get.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
