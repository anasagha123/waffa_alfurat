import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void showSnackBar(
    {String? title, required String message, required SnackBarState state}) {
  Get.showSnackbar(GetSnackBar(
    title: title,
    message: message,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 5),
    backgroundColor: backGroundColor(state: state),
  ));
}

enum SnackBarState { success, error, warning }

Color backGroundColor({required SnackBarState state}) {
  switch (state) {
    case SnackBarState.success:
      return Colors.green;
    case SnackBarState.error:
      return Colors.red;
    case SnackBarState.warning:
      return Colors.amber;
  }
}
