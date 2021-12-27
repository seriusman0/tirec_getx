import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final otpC = TextEditingController();

  @override
  void onClose() {
    otpC.dispose();
    super.onClose();
  }
}
