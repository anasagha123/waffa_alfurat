import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffat_alfurat/components/brand_card.dart';
import 'package:waffat_alfurat/components/my_drawer.dart';
import 'package:waffat_alfurat/controllers/home_screen_controller/brands_controller.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<BrandsController>(
          init: BrandsController(),
          builder: (controller) => Visibility(
            visible: !controller.isloading,
            replacement: const Center(child: CircularProgressIndicator()),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                childAspectRatio: 0.6,
              ),
              itemCount: controller.brands.length,
              itemBuilder: (BuildContext context, int index) => BrandCard(
                brand: controller.brands[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
