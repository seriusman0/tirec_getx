import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:tirec_getx/app/controllers/auth_controller.dart';
import 'package:tirec_getx/app/data/models/product_model.dart';
import 'package:tirec_getx/app/modules/item_card/views/item_card_view.dart';
import 'package:tirec_getx/app/routes/app_pages.dart';
import '../../../../contants.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  int _currentIndex = 0;
  List<Widget> body = const [
    Icon(Icons.home),
    Icon(Icons.menu),
    Icon(Icons.person),
  ];

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
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.74,
                      mainAxisSpacing: kDefaultPaddin,
                      crossAxisSpacing: kDefaultPaddin),
                  itemCount: listAllDocs!.length,
                  itemBuilder: (content, index) => Expanded(
                      flex: 2,
                      child: ItemCardView(
                        product: listAllDocs[index].data()!,
                        press: () => Get.toNamed(Routes.EDIT_PRODUCT,
                            arguments: listAllDocs[index].id),
                      ))
                  // ListTile(
                  //   onTap: () => Get.toNamed(Routes.EDIT_PRODUCT,
                  //       arguments: listAllDocs[index].id),
                  //   title: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: kDefaultPaddin),
                  //     child: Text(
                  //       "${listAllDocs[index].data()!.name}",
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .headline5!
                  //           .copyWith(fontWeight: FontWeight.bold),
                  //     ),
                  //   ),
                  //   subtitle:
                  //       Text("Rp ${listAllDocs[index].data()!.price}"),
                  //   trailing: IconButton(
                  //     onPressed: () =>
                  //         controller.deleteProduct(listAllDocs[index].id),
                  //     icon: Icon(Icons.delete),
                  //   ),
                  // )
                  ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          if (newIndex == 1) Get.toNamed(Routes.DETAIL_PRODUCT);
          if (newIndex == 0)
            Get.toNamed(Routes.HOME);
          else
            Get.toNamed(Routes.DETAIL_PRODUCT);
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Menu',
            icon: Icon(Icons.menu),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_PRODUCT),
        child: Icon(Icons.add),
      ),
    );
  }
}
