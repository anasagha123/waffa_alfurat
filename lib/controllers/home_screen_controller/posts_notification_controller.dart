import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:waffat_alfurat/controllers/user_controller.dart';
import 'package:waffat_alfurat/network/remote/dio_helper.dart';

class PostsNotificationController extends GetxController {
  int oldpostscount =
      UserController.sharedPreferences.getInt("postsCount") ?? 0;
  int newPostsCount = 0;
  late int postscount;
  bool isloading = false;

  setPostcount() {
    UserController.sharedPreferences.setInt("postsCount", postscount);
    oldpostscount = postscount;
    newPostsCount = 0;
  }

  getNotificationCount() async {
    isloading = true;
    update();

    Response response = await DioHelper.getData(path: EndPoints.getPostsCount);
    postscount = response.data;

    newPostsCount = postscount - oldpostscount;

    isloading = false;
    update();
  }
}
