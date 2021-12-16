import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final emailC = TextEditingController(text: "");
  final passC = TextEditingController(text: "");

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
