import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffaa_alfurat/models/post_model.dart';

class PostDetailsScreen extends StatelessWidget {
  final Post post;

  const PostDetailsScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.03,
            vertical: Get.height * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${post.title}",
                style: Get.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
                maxLines: 3,
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Text(
                "${post.description}",
                maxLines: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
