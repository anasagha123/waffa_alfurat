import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultTextFormField extends StatelessWidget {
  final IconData iconData;
  final String hintText;
  final TextEditingController textEditingController;
  final bool isObscured;
  const DefaultTextFormField({
    super.key,
    required this.iconData,
    required this.hintText,
    required this.textEditingController,
    this.isObscured = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.06,
      child: TextFormField(
        obscureText: isObscured,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Get.textTheme.bodyMedium!.copyWith(color: Colors.grey),
          prefixIcon: Container(
            height: Get.height * 0.06,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Get.theme.colorScheme.primary,
            ),
            child: Icon(
              iconData,
              color: Get.theme.colorScheme.onPrimary,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }
}
