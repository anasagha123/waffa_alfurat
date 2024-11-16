import 'package:get/get.dart';
import 'package:waffaa_alfurat/models/post_model.dart';
import 'package:waffaa_alfurat/network/remote/http_client.dart';

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
    Response response = await HttpClient.getData(path: EndPoints.getPosts);

    response.body ?? [];

    for (int i = response.body.length - 1; i >= 0; i--) {
      posts.add(Post.fromJson(response.body[i]));
    }

    isloading = false;
    update();
  }
}
