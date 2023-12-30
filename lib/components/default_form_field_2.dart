import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultTextFormField2 extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;
  final bool isObsecure;
  final TextDirection textDirection;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  const DefaultTextFormField2(
      {super.key,
      required this.hintText,
      required this.textEditingController,
      this.validator,
      this.textInputType = TextInputType.text,
      this.isObsecure = false,
      this.textDirection = TextDirection.rtl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.9,
      height: Get.height * 0.06,
      child: TextFormField(
        controller: textEditingController,
        validator: validator,
        keyboardType: textInputType,
        obscureText: isObsecure,
        textDirection: textDirection,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
