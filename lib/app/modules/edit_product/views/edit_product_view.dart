import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_product_controller.dart';

class EditProductView extends GetView<EditProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Product'),
          centerTitle: true,
        ),
        body: FutureBuilder<DocumentSnapshot<Object?>>(
          future: controller.getData(Get.arguments),
          builder: (content, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data!.data()! as Map<String, dynamic>;
              controller.nameC.text = data["name"];
              controller.priceC.text = (data["price"]).toString();
              controller.fDateC.text = (data["fDate"]).toString();
              controller.lDateC.text = (data["lDate"]).toString();
              controller.noteC.text = data["note"];
              controller.statusC.text = (data["status"]).toString();
              controller.recC.text = (data["rec"]).toString();
              return ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: controller.nameC,
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          decoration:
                              InputDecoration(labelText: "Product Name"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: controller.priceC,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration:
                              InputDecoration(labelText: "Product Price"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: controller.fDateC,
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(labelText: "First Use"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: controller.lDateC,
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(labelText: "Last Use"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: controller.noteC,
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(labelText: "Note"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: controller.statusC,
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(labelText: "Status"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: controller.recC,
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          decoration:
                              InputDecoration(labelText: "Recomended ?"),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                            onPressed: () => controller.editProduct(
                                controller.nameC.text,
                                controller.priceC.text,
                                controller.fDateC.text,
                                controller.lDateC.text,
                                controller.noteC.text,
                                controller.statusC.text,
                                controller.recC.text,
                                Get.arguments.toString()),
                            child: Text("UPDATE PRODUCT"))
                      ],
                    ),
                  )
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
