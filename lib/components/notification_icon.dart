import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffat_alfurat/controllers/home_screen_controller/posts_notification_controller.dart';

class NotificationIconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onPressed;

  const NotificationIconButton({
    super.key,
    required this.iconData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(iconData),
          color: Colors.white,
        ),
        GetBuilder<PostsNotificationController>(
          init: PostsNotificationController(),
          builder: (controller) => Visibility(
            visible: controller.count > 0,
            child: Positioned(
              right: 11,
              top: 11,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: const BoxConstraints(
                  minWidth: 14,
                  minHeight: 14,
                ),
                child: Text(
                  "${controller.count}",
                  style: const TextStyle(
                    fontSize: 8,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
