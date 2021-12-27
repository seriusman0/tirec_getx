import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tirec_getx/app/data/models/product_model.dart';
import '../../../data/models/product_model.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final productRef =
      FirebaseFirestore.instance.collection("products").withConverter<Product>(
            fromFirestore: (snapshot, options) =>
                Product.fromJson(snapshot.data()!),
            toFirestore: (value, options) => value.toJson(),
          );
  Stream<QuerySnapshot<Product?>> streamData() {
    return productRef.snapshots();
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
