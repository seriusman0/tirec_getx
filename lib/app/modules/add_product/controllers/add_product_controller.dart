import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tirec_getx/app/data/models/product_model.dart';

class AddProductController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;
  late TextEditingController fDateC;
  late TextEditingController lDateC;
  late TextEditingController noteC;
  late TextEditingController statusC;
  late TextEditingController recC;

  final productRef =
      FirebaseFirestore.instance.collection("products").withConverter(
            fromFirestore: (snapshot, options) =>
                Product.fromJson(snapshot.data()!),
            toFirestore: (value, options) => value.toJson(),
          );
  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(String name, String price) async {
    // CollectionReference products = firestore.collection("products");

    try {
      await productRef.add(Product(
        name: name,
        price: price,
        fDate: (DateTime.now()).toString(),
        lDate: "",
        note: "",
        status: false.toString(),
        rec: false.toString(),
      ));

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
