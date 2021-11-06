import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailC = TextEditingController(text: "seriusman0@gmail.com");
  final passC = TextEditingController(text: "serius");
  final phoneC = TextEditingController();

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    phoneC.dispose();
    super.onClose();
  }
}
