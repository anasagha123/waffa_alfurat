import 'package:get/get.dart';
import 'package:waffaa_alfurat/controllers/home_screen_controller/agents_controller.dart';
import 'package:waffaa_alfurat/controllers/home_screen_controller/banner_controller.dart';
import 'package:waffaa_alfurat/controllers/home_screen_controller/brands_controller.dart';
import 'package:waffaa_alfurat/controllers/home_screen_controller/posts_notification_controller.dart';
import 'package:waffaa_alfurat/controllers/points_controller.dart';

class HomeScreenController extends GetxController {
  final BannerController bannerController = Get.put(BannerController());
  final AgentsController agentsController = Get.put(AgentsController());
  final BrandsController brandsController = Get.put(BrandsController());
  final PostsNotificationController postsNotificationController =
      Get.put(PostsNotificationController());

  HomeScreenController() {
    Get.put(PointsController());
    getData();
  }

  getData() async {
    bannerController.getImages();
    agentsController.getAgents();
    brandsController.getBrands();
    postsNotificationController.getNotificationCount();
  }
}
