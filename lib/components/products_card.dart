import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffat_alfurat/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

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
              "https://wafaaalfurat.store/storage/${product.image!}",
              fit: BoxFit.cover,
            ),
          ),
          Divider(height: Get.height * 0.008),
          Text(
            "${product.title}",
            style: Get.textTheme.bodySmall,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Get.height * 0.01),
          Text(
            "${product.price} د.ع",
            style: Get.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
