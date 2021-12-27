import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tirec_getx/app/modules/splash/views/components/splash_content.dart';
import 'package:tirec_getx/app/routes/app_pages.dart';
import 'package:tirec_getx/components/default_button.dart';

import '../../../../../contants.dart';
import '../../../../../size_config.dart';

class Body extends StatelessWidget {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {"text": "Welcome to Tirec App", "image": "assets/images/splash_1.png"},
    {
      "text": "This App will be with your notes \nabout all your stuff",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "This is easier way to . \nRecomended a thing to others",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                      itemCount: splashData.length,
                      itemBuilder: (context, index) => SplashContent(
                        image: splashData[index]["image"],
                        text: splashData[index]['text'],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Column(
                        children: <Widget>[
                          Spacer(flex: 3),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              splashData.length,
                              (index) => buildDot(index: index),
                            ),
                          ),
                          Spacer(flex: 3),
                          DefaultButton(
                            text: "Continue",
                            press: () {
                              Get.offAllNamed(Routes.LOGIN);
                            },
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Colors.blue[800],
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

void setState(Null Function() param0) {}
