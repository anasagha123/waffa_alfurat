import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffat_alfurat/components/gift_card.dart';
import 'package:waffat_alfurat/components/my_drawer.dart';
import 'package:waffat_alfurat/controllers/gift_screen_controller.dart';
import 'package:waffat_alfurat/controllers/points_controller.dart';
import 'package:waffat_alfurat/controllers/user_controller.dart';

class GiftsScreen extends StatelessWidget {
  final PointsController pointsController = Get.find();
  final GiftScreenController giftController = Get.put(GiftScreenController());
  GiftsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              giftController.getGifts();
              pointsController.getPoints();
            },
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
          replacement: Center(
            child: CircularProgressIndicator(
              color: Get.theme.colorScheme.primary,
            ),
          ),
          child: Column(
            children: [
              Visibility(
                visible: UserController.userType != UserType.visitor,
                child: Container(
                    width: Get.width * 0.9,
                    height: Get.height * 0.1,
                    decoration: BoxDecoration(
                      color: Get.theme.colorScheme.primary.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: FutureBuilder<String>(
                      future: pointsController.getPoints(),
                      builder: (ctx, snapshot) {
                        if (snapshot.hasData) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "رصيد النقاط",
                                style: Get.textTheme.bodyLarge,
                              ),
                              const Text(":"),
                              Text(
                                pointsController.points ?? "0",
                                style: Get.textTheme.bodyLarge,
                              ),
                            ],
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    )
                    // Visibility(
                    //   visible: !pointorller.isloading,
                    //   replacement:
                    //       const Center(child: CircularProgressIndicator()),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     children: [
                    //       Text(
                    //         "رصيد النقاط",
                    //         style: Get.textTheme.bodyLarge,
                    //       ),
                    //       const Text(":"),
                    //       Text(
                    //         pointorller.points ?? "0",
                    //         style: Get.textTheme.bodyLarge,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    ),
              ),
              SizedBox(
                height: UserController.userType != UserType.visitor
                    ? Get.height * 0.9
                    : Get.height * 0.7,
                child: Visibility(
                  visible: !controller.isloading,
                  replacement: const Center(child: CircularProgressIndicator()),
                  child: GridView.count(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      vertical: Get.height * 0.03,
                      horizontal: Get.width * 0.05,
                    ),
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: Get.width * 0.05,
                    mainAxisSpacing: Get.height * 0.03,
                    children: [
                      for (int i = 0; i < controller.gifts.length; i++)
                        GiftCard(
                          gift: controller.gifts[i],
                          index: i,
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
