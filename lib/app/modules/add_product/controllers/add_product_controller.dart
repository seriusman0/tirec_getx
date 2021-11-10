import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(String name, String price) async {
    CollectionReference products = firestore.collection("products");

    try {
      await products.add({
        "name": name,
        "price": int.parse(price),
        "fDate": new DateTime.now(),
        "lDate": "",
        "note": "",
        "status": false,
        "rec": false,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menambahkan produk",
        onConfirm: () {
          nameC.clear();
          priceC.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "Oke",
      );
    } catch (e) {
      print(e.toString());
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak berhasil menambahkan produk",
      );
    }
  }

  @override
  onInit() {
    nameC = TextEditingController();
    priceC = TextEditingController();
    super.onInit();
  }

  @override
  onClose() {
    nameC.dispose();
    priceC.dispose();
    super.onClose();
  }
}
