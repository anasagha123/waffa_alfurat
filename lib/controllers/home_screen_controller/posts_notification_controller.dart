import 'package:get/get.dart';
import 'package:waffaa_alfurat/controllers/user_controller.dart';
import 'package:waffaa_alfurat/network/remote/http_client.dart';

class PostsNotificationController extends GetxController {
  List<String> posts = [];
  int count = 0;
  bool isloading = false;

  getNotificationCount() async {
    isloading = true;
    update();

    Response response = await HttpClient.getData(path: EndPoints.getPosts);
    for (int i = 0; i < (response.body.length ?? 0); i++) {
      if (!posts.contains(response.body[i]["id"].toString())) {
        posts.add(response.body[i]["id"].toString());
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
