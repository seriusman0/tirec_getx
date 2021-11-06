import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tirec_getx/app/controllers/auth_controller.dart';
import 'package:tirec_getx/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Screen'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(
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
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () => Get.toNamed(Routes.RESET_PASSWORD),
                      child: Text("Reset Password"))),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () => authC.login(
                          controller.emailC.text, controller.passC.text),
                      child: Text("LOGIN")),
                  ElevatedButton(
                      onPressed: () => authC.LoginAnonimous(),
                      child: Text("LOGIN ANONIMOUS")),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Belum Punya Akun ? "),
                  TextButton(
                      onPressed: () => Get.toNamed(Routes.SIGNUP),
                      child: Text("DAFTAR SEKARANG"))
                ],
              ),
              Divider(color: Colors.black),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.phoneC,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    labelText: "Phone Number", border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => authC.loginPhone(controller.phoneC.text),
                  child: Text("Send OTP ")),
            ],
          ),
        ));
  }
}
