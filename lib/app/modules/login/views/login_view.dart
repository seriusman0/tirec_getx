import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tirec_getx/app/controllers/auth_controller.dart';
import 'package:tirec_getx/components/default_button.dart';
import 'package:tirec_getx/components/no_account_text.dart';
import 'package:tirec_getx/components/socal_card.dart';
import '../../../../size_config.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login Screen'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sign in with your email and password  \nor continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.emailC,
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Enter your email",
                            // If  you are using latest version of flutter then lable text and hint text shown like this
                            // if you r using flutter less then 1.20.* then maybe this is not working properly
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        TextFormField(
                          controller: controller.passC,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Enter your password",
                            // If  you are using latest version of flutter then lable text and hint text shown like this
                            // if you r using flutter less then 1.20.* then maybe this is not working properly
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        SizedBox(height: getProportionateScreenHeight(20)),
                        DefaultButton(
                          text: "Continue",
                          press: () => authC.login(
                              controller.emailC.text, controller.passC.text),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () {},
                      ),
                      SocalCard(
                        icon: "assets/icons/facebook-2.svg",
                        press: () {},
                      ),
                      SocalCard(
                        icon: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  NoAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.all(25.0),
      //   child: ListView(
      //     children: [
      //       TextField(
      //         controller: controller.emailC,
      //         decoration: InputDecoration(labelText: "Email"),
      //       ),
      //       TextField(
      //         controller: controller.passC,
      //         decoration: InputDecoration(labelText: "Password"),
      //       ),
      //       SizedBox(
      //         height: 10,
      //       ),
      //       Align(
      //           alignment: Alignment.centerRight,
      //           child: TextButton(
      //               onPressed: () => Get.toNamed(Routes.RESET_PASSWORD),
      //               child: Text("Reset Password"))),
      //       SizedBox(
      //         height: 50,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           ElevatedButton(
      //               onPressed: () => authC.login(
      //                   controller.emailC.text, controller.passC.text),
      //               child: Text("LOGIN")),
      //           ElevatedButton(
      //               onPressed: () => authC.LoginAnonimous(),
      //               child: Text("LOGIN ANONIMOUS")),
      //         ],
      //       ),
      //       SizedBox(
      //         height: 10,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text("Belum Punya Akun ? "),
      //           TextButton(
      //               onPressed: () => Get.toNamed(Routes.SIGNUP),
      //               child: Text("DAFTAR SEKARANG"))
      //         ],
      //       ),
      //       Divider(color: Colors.black),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       TextField(
      //         controller: controller.phoneC,
      //         keyboardType: TextInputType.phone,
      //         decoration: InputDecoration(
      //             labelText: "Phone Number", border: OutlineInputBorder()),
      //       ),
      //       SizedBox(height: 20),
      //       ElevatedButton(
      //           onPressed: () => authC.loginPhone(controller.phoneC.text),
      //           child: Text("Send OTP ")),
      //     ],
      //   ),
      // )
    );
  }
}
