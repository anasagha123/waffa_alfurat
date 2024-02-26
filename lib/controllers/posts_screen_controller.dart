import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:waffat_alfurat/models/post_model.dart';
import 'package:waffat_alfurat/network/remote/dio_helper.dart';

class PostsScreenController extends GetxController {
  bool isloading = false;
  List<Post> posts = [];

  PostsScreenController() {
    getPosts();
  }

  getPosts() async {
    isloading = true;
    update();

    posts = [];
    Response response = await DioHelper.getData(path: EndPoints.getPosts);

    response.data ?? [];

    for (int i = response.data.length - 1; i >= 0; i--) {
      posts.add(Post.fromJson(response.data[i]));
    }

    isloading = false;
    update();
  }
}
