import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
}
