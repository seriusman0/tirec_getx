import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference products = firestore.collection("products");
    return products.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products = firestore.collection("products");
    return products.orderBy("fDate", descending: true).snapshots();
  }

  void deleteProduct(String docId) async {
    DocumentReference docRef = firestore.collection("products").doc(docId);
    try {
      Get.defaultDialog(
        title: "Delete",
        middleText: "Anda Yakin menghapus data ini?",
        onConfirm: () => docRef.delete(),
        textConfirm: "Yes",
        textCancel: "No",
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak Berhasil menghapus data",
      );
    }
  }
}
