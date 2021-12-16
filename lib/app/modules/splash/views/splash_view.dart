import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../size_config.dart';
import '../controllers/splash_controller.dart';
import 'components/body.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
