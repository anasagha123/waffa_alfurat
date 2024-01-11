import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffat_alfurat/components/post_card.dart';
import 'package:waffat_alfurat/controllers/posts_screen_controller.dart';

class PostsScreen extends StatelessWidget {
  final PostsScreenController screenController =
      Get.put(PostsScreenController());
  PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: screenController.getPosts,
              icon: const Icon(
                Icons.refresh_rounded,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: GetBuilder<PostsScreenController>(
          builder: (controller) => Visibility(
            visible: !controller.isloading,
            replacement: const CircularProgressIndicator(),
            child: ListView.builder(
              itemBuilder: (ctx, index) => PostCard(
                post: controller.posts[index],
              ),
              itemCount: controller.posts.length,
            ),
          ),
        ),
      ),
    );
  }
}
