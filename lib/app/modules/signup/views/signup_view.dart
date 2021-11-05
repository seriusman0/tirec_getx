import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tirec_getx/app/controllers/auth_controller.dart';
import 'package:tirec_getx/app/routes/app_pages.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SignupView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TextField(
                controller: controller.emailC,
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: controller.passC,
                decoration: InputDecoration(labelText: "Password"),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () => authC.signup(
                      controller.emailC.text, controller.passC.text),
                  child: Text("DAFTAR")),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sudah Punya Akun ? "),
                  TextButton(onPressed: () => Get.back(), child: Text("LOGIN"))
                ],
              ),
            ],
          ),
        ));
  }
}
