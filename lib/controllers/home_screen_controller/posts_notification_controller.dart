import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:waffat_alfurat/controllers/user_controller.dart';
import 'package:waffat_alfurat/network/remote/dio_helper.dart';

class PostsNotificationController extends GetxController {
  List<String> posts = [];
  int count = 0;
  bool isloading = false;

  getNotificationCount() async {
    isloading = true;
    update();

    Response response = await DioHelper.getData(path: EndPoints.getPosts);
    for (int i = 0; i < (response.data.length ?? 0); i++) {
      if (!posts.contains(response.data[i]["id"].toString())) {
        posts.add(response.data[i]["id"].toString());
      }
    }

    count = absolute(posts.length - UserController.cachedPosts.length);

    isloading = false;
    update();
  }
}

absolute(int x) {
  switch (x) {
    case > 0:
      return x;
    case < 0:
      return -1 * x;
    default:
      return 0;
  }
}
