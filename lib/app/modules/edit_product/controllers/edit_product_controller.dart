import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;
  late TextEditingController fDateC;
  late TextEditingController lDateC;
  late TextEditingController noteC;
  late TextEditingController statusC;
  late TextEditingController recC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("products").doc(docID);
    return docRef.get();
  }

  void editProduct(String name, String price, String fDate, String lDate,
      String note, String status, String rec, String docID) async {
    DocumentReference docData = firestore.collection("products").doc(docID);

    try {
      await docData.update({
        "name": name,
        "price": int.parse(price),
        "fDate": fDate,
        "lDate": lDate,
        "note": note,
        "status": status,
        "rec": rec,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil edit data produk",
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
        middleText: "Tidak berhasil edit data produk",
      );
    }
  }

  @override
  onInit() {
    nameC = TextEditingController();
    priceC = TextEditingController();
    fDateC = TextEditingController();
    lDateC = TextEditingController();
    noteC = TextEditingController();
    statusC = TextEditingController();
    recC = TextEditingController();
    super.onInit();
  }

  @override
  onClose() {
    nameC.dispose();
    priceC.dispose();
    fDateC.dispose();
    lDateC.dispose();
    noteC.dispose();
    statusC.dispose();
    recC.dispose();
    super.onClose();
  }
}
