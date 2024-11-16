import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffaa_alfurat/controllers/profile_screen_controller.dart';

class DeleteUserDialog extends StatelessWidget {
  final ProfileScreenController profileScreenController = Get.find();

  DeleteUserDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("هل انت متأكد من من حذف الحساب"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    Get.back();
                    await profileScreenController.deleteAccount();
                  },
                  child: const Text("تأكيد")),
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("الغاء")),
            ],
          )
        ],
      ),
    );
  }
}
