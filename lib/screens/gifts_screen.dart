import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffat_alfurat/components/gift_card.dart';
import 'package:waffat_alfurat/components/my_drawer.dart';
import 'package:waffat_alfurat/controllers/gift_screen_controller.dart';

class GiftsScreen extends StatelessWidget {
  final GiftScreenController screenController = Get.put(GiftScreenController());
  GiftsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: screenController.getGifts,
            icon: Icon(
              Icons.refresh_rounded,
              color: Get.theme.colorScheme.onPrimary,
            ),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: GetBuilder<GiftScreenController>(
        builder: (controller) => Visibility(
          visible: !controller.isloading,
          replacement: Center(
              child: CircularProgressIndicator(
            color: Get.theme.colorScheme.primary,
          )),
          child: Visibility(
            visible: controller.gifts.isNotEmpty,
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
                for (int i = 0; i < controller.gifts.length; i++)
                  GiftCard(gift: controller.gifts[i])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
