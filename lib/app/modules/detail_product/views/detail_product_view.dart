import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tirec_getx/app/data/models/product_model.dart';

import '../../../../contants.dart';
import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('DetailProductView'),
          centerTitle: true,
        ),
        body: Center(
          child: Text("It works"),
        ));
  }
}
