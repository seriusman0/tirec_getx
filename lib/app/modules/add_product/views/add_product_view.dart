import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  late File _image;
  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      ImagePicker pickImage = ImagePicker();
      var image = await pickImage.pickImage(
        source: ImageSource.gallery,
      );
      onInit() {
        _image = image as File;
        Get.snackbar("Berhasil", "Berhasil Upload Image");
      }
    }

    Future uploadPic(BuildContext context) async {
      // String fileName = basename(_image.path);
      // StorageReference firebaseStorageRef =
      //     FirebaseStorage.instance.ref().child(fileName);
      // StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      // StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete();
      // onInit(() {
      //   print("Profile Picture uploaded");
      //   Scaffold.of(context)
      //       .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      // });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Add Product'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.blue,
                          child: ClipOval(
                              child: SizedBox(
                            width: 180.0,
                            height: 180.0,
                            child:
                                // (_image != null)? Image.file(_image, fit: BoxFit.fill):
                                Image.network(
                              "https://image.shutterstock.com/image-vector/clipboard-gear-icon-project-management-260nw-1912270288.jpg",
                              fit: BoxFit.fill,
                            ),
                          )),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 60.0),
                          child: IconButton(
                            icon: Icon(FontAwesomeIcons.camera, size: 30.0),
                            onPressed: () {
                              Get.snackbar("On Development",
                                  "Untuk sementara, belum dapat digunakan sementara");
                              // getImage();
                            },
                          )),
                    ],
                  ),
                  TextField(
                    autofocus: true,
                    controller: controller.nameC,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "Product Name"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.priceC,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(labelText: "Product Price"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        controller.addProduct(
                            controller.nameC.text, controller.priceC.text);
                        uploadPic(context);
                      },
                      child: Text("ADD PRODUCT"))
                ],
              ),
            ),
          ],
        ));
  }
}
