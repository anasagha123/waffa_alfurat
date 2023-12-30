import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffat_alfurat/components/my_drawer.dart';
import 'package:waffat_alfurat/components/products_card.dart';
import 'package:waffat_alfurat/controllers/product_screen_controller.dart';

class ProductsScreen extends StatelessWidget {
  final ProductScreenController screenController =
      Get.put(ProductScreenController());
  ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: screenController.getProducts,
              icon: Icon(
                Icons.refresh_rounded,
                color: Get.theme.colorScheme.onPrimary,
              ))
        ],
      ),
      drawer: const MyDrawer(),
      body: GetBuilder<ProductScreenController>(
        builder: (controller) => Visibility(
          visible: !controller.isloading,
          replacement: Center(
              child: CircularProgressIndicator(
            color: Get.theme.colorScheme.primary,
          )),
          child: Visibility(
            visible: controller.products.isNotEmpty,
            replacement: const Center(child: Text("لا يوجد منتجات")),
            child: GridView.count(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  vertical: Get.height * 0.03, horizontal: Get.width * 0.05),
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: Get.width * 0.05,
              mainAxisSpacing: Get.height * 0.03,
              children: [
                for (int i = 0; i < controller.products.length; i++)
                  ProductCard(product: controller.products[i])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
