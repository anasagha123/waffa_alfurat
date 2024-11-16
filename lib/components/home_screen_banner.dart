import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreenBanner extends StatefulWidget {
  final List<String> images;

  const HomeScreenBanner({super.key, required this.images});

  @override
  State<HomeScreenBanner> createState() => _HomeScreenBannerState();
}

class _HomeScreenBannerState extends State<HomeScreenBanner> {
  final PageController pageController = PageController();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      pageController.animateToPage(
        (pageController.page!.round() + 1) % widget.images.length,
        duration: const Duration(milliseconds: 600),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      width: Get.width * 0.9,
      height: Get.height * 0.2,
      child: Stack(
        children: [
          PageView(
            controller: pageController,
            children: widget.images.isNotEmpty
                ? [
                    for (int i = 0; i < widget.images.length; i++)
                      Image.network(
                        widget.images[i],
                        fit: BoxFit.fill,
                      )
                  ]
                : [Image.asset("assets/images/waffa_logo.png")],
          ),
          Visibility(
            visible: widget.images.length > 1,
            child: Padding(
              padding: EdgeInsets.only(bottom: Get.height * 0.01),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SmoothPageIndicator(
                  count: widget.images.length,
                  controller: pageController,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
