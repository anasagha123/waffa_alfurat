import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:waffat_alfurat/network/remote/dio_helper.dart';

class PostsCounterController extends GetxController {
  int count = 0;
  bool isloading = false;

  PostsCounterController() {
    getNotificationCount();
  }

  getNotificationCount() async {
    isloading = true;
    update();

    Response response = await DioHelper.getData(path: EndPoints.getPostsCount);

    count = response.data;

    isloading = false;
    update();
  }
}
