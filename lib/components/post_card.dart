import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffat_alfurat/models/post_model.dart';
import 'package:waffat_alfurat/screens/post_details_screen.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Get.height * 0.01, horizontal: Get.width * 0.03),
      child: GestureDetector(
        onTap: () {
          Get.to(PostDetailsScreen(post: post));
        },
        child: Container(
          width: Get.width * 0.9,
          height: Get.height * 0.15,
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.05,
            vertical: Get.height * 0.02,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                // offset: const Offset(-25, 20),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${post.title}",
                    style: Get.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "قراءة المزيد",
                    style:
                        Get.textTheme.bodySmall!.copyWith(color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Text(
                "${post.description}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
