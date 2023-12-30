import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:waffat_alfurat/components/agent_card.dart';
import 'package:waffat_alfurat/components/agnecy_card.dart';
import 'package:waffat_alfurat/components/my_drawer.dart';
import 'package:waffat_alfurat/components/home_screen_banner.dart';
import 'package:waffat_alfurat/controllers/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  final ScrollController scrollController = ScrollController();
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
          IconButton(
            onPressed: () {
              Get.toNamed("invoice");
            },
            icon: Icon(
              Icons.wallet_giftcard,
              color: Get.theme.colorScheme.onPrimary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: Get.theme.colorScheme.onPrimary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.refresh_rounded,
              color: Get.theme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
        child: SingleChildScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<HomeScreenController>(
            builder: (controller) => Visibility(
              visible: !controller.isloading,
              replacement: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    const HomeScreenBanner(images: [1]),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    SizedBox(
                      height: Get.height * 0.2,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: Get.height * 0.2,
                          width: Get.width * 0.25,
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          width: Get.width * 0.03,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: Get.height * 0.3,
                          width: Get.width * 0.9,
                        ),
                        SizedBox(height: Get.height * 0.03),
                        Container(
                          padding: EdgeInsets.only(bottom: Get.height * 0.03),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: Get.height * 0.3,
                          width: Get.width * 0.9,
                        ),
                        SizedBox(height: Get.height * 0.03),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: Get.height * 0.3,
                          width: Get.width * 0.9,
                        ),
                        SizedBox(height: Get.height * 0.03),
                      ],
                    ),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Text(
                    "اهلا بك في شركة وفاء الفرات",
                    style: Get.textTheme.bodyLarge,
                  ),
                  const HomeScreenBanner(images: [1, 2, 3, 4]),
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
                        onPressed: () {},
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
                    height: Get.height * 0.2,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) => AgnecyCard(),
                      separatorBuilder: (context, index) => SizedBox(
                        width: Get.width * 0.03,
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
                        onPressed: () {},
                        child: Text(
                          "عرض المزيد",
                          style: Get.textTheme.bodySmall!.copyWith(
                            color: Get.theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      AgentCard(),
                      AgentCard(),
                      AgentCard(),
                      AgentCard(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
