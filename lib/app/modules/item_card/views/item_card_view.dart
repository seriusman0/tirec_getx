import 'package:flutter/material.dart';
import 'package:tirec_getx/app/data/models/product_model.dart';

import '../../../../contants.dart';

class ItemCardView extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCardView({Key? key, required this.product, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press.call(),
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(kDefaultPaddin),
          height: 180,
          width: 160,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(16)),
          child: Image.network(
            "https://www.almahmood.co/wp-content/uploads/2020/04/test-product.png",
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
          child: Text(
            // products is out demo list
            product.name.toString(),
            style: TextStyle(color: kTextLightColor),
          ),
        ),
        Text(
          product.price.toString(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
