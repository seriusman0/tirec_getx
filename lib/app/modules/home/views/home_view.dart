import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:tirec_getx/app/controllers/auth_controller.dart';
import 'package:tirec_getx/app/data/models/product_model.dart';
import 'package:tirec_getx/app/routes/app_pages.dart';
import '../../../../contants.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'My List',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              // By default our  icon color is white
              color: kTextColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.red,
            ),
            onPressed: () => authC.logout(),
          ),
          SizedBox(width: kDefaultPaddin / 2)
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Product?>>(
        stream: controller.streamData(),
        builder: (context, snapshot) {
          var listAllDocs = snapshot.data?.docs;
          if (snapshot.connectionState == ConnectionState.active) {
            return ListView.builder(
                itemCount: listAllDocs!.length,
                itemBuilder: (content, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(kDefaultPaddin),
                          height: 180,
                          width: 160,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(16)),
                          child: Image.asset("assets/images/bag_1.png"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPaddin / 4),
                          child: Text(
                            // products is out demo list
                            "${listAllDocs[index].data()!.name}",
                            style: TextStyle(color: kTextLightColor),
                          ),
                        ),
                        Text(
                          "${listAllDocs[index].data()!.price}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                // ListTile(
                //       onTap: () => Get.toNamed(Routes.EDIT_PRODUCT,
                //           arguments: listAllDocs[index].id),
                //       title: Padding(
                //         padding: const EdgeInsets.symmetric(
                //             horizontal: kDefaultPaddin),
                //         child: Text(
                //           "${(listAllDocs[index].data() as Map<String, dynamic>)["name"]}",
                //           style: Theme.of(context)
                //               .textTheme
                //               .headline5!
                //               .copyWith(fontWeight: FontWeight.bold),
                //         ),
                //       ),
                //       subtitle: Text(
                //           "Rp ${(listAllDocs[index].data() as Map<String, dynamic>)["price"]}"),
                //       trailing: IconButton(
                //         onPressed: () =>
                //             controller.deleteProduct(listAllDocs[index].id),
                //         icon: Icon(Icons.delete),
                //       ),
                //     )
                );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_PRODUCT),
        child: Icon(Icons.add),
      ),
    );
  }
}
