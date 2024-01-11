import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:waffat_alfurat/components/agent_card.dart';
import 'package:waffat_alfurat/components/brand_card.dart';
import 'package:waffat_alfurat/components/my_drawer.dart';
import 'package:waffat_alfurat/components/home_screen_banner.dart';
import 'package:waffat_alfurat/controllers/home_screen_controller/agents_controller.dart';
import 'package:waffat_alfurat/controllers/home_screen_controller/banner_controller.dart';
import 'package:waffat_alfurat/controllers/home_screen_controller/brands_controller.dart';
import 'package:waffat_alfurat/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:waffat_alfurat/controllers/user_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenController screenController = Get.put(HomeScreenController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          width: Get.width * 0.13,
          child: Image.asset(
            "assets/images/waffa_logo.png",
            fit: BoxFit.cover,
          ),
        ),
        actions: [
          Visibility(
            visible: UserController.userType != UserType.visitor,
            child: IconButton(
              onPressed: () {
                Get.toNamed("invoice");
              },
              icon: Icon(
                Icons.wallet_giftcard,
                color: Get.theme.colorScheme.onPrimary,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed("posts");
            },
            icon: Icon(
              Icons.notifications_outlined,
              color: Get.theme.colorScheme.onPrimary,
            ),
          ),
          IconButton(
            onPressed: screenController.getData,
            icon: Icon(
              Icons.refresh_rounded,
              color: Get.theme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(right: Get.width * 0.05),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.05,
              ),
              Text(
                "اهلا بك في شركة وفاء الفرات",
                style: Get.textTheme.bodyLarge,
              ),
              GetBuilder<BannerController>(
                builder: (controller) => Visibility(
                    visible: !controller.isloading,
                    replacement: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.white,
                      child: Container(
                        width: Get.width * 0.9,
                        height: Get.height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    child: HomeScreenBanner(images: controller.images)),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "الوكالات",
                    style: Get.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAllNamed("brands");
                    },
                    child: Text(
                      "عرض المزيد",
                      style: Get.textTheme.bodySmall!.copyWith(
                        color: Get.theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.18,
                child: GetBuilder<BrandsController>(
                  builder: (controller) => Visibility(
                    visible: !controller.isloading,
                    replacement: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.white,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        separatorBuilder: (ctx, index) =>
                            SizedBox(width: Get.width * 0.05),
                        itemBuilder: (context, index) => Container(
                          height: Get.height * 0.3,
                          width: Get.width * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.brands.length < 6
                          ? controller.brands.length
                          : 6,
                      separatorBuilder: (ctx, index) =>
                          SizedBox(width: Get.width * 0.05),
                      itemBuilder: (ctx, index) => BrandCard(
                        brand: controller.brands[index],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "الوكلاء",
                    style: Get.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAllNamed("agents");
                    },
                    child: Text(
                      "عرض المزيد",
                      style: Get.textTheme.bodySmall!.copyWith(
                        color: Get.theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              GetBuilder<AgentsController>(
                builder: (controller) => Visibility(
                  visible: !controller.isloading,
                  replacement: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white,
                    child: Column(
                      children: [
                        for (int i = 0; i < 4; i++)
                          Padding(
                            padding: EdgeInsets.only(bottom: Get.height * 0.03),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: Get.height * 0.3,
                              width: Get.width * 0.9,
                            ),
                          ),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      for (int i = 0;
                          i < 4 && i < controller.agents.length;
                          i++)
                        AgentCard(agent: controller.agents[i]),
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
