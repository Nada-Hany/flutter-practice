import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'animals_page.dart';

import 'trans_api.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("aa"),
        SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(Animals());
                  },
                  child: Image.asset("assets/animals.jpg",
                      width: 150, height: 150),
                ),
                SizedBox(
                  height: 60,
                ),
                InkWell(
                  onTap: () {
                    Get.to(API());
                  },
                  child:
                      Image.asset("assets/fruit.jpg", width: 150, height: 150),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Image.asset("assets/planets.jpg",
                      width: 150, height: 150),
                ),
                SizedBox(
                  height: 60,
                ),
                InkWell(
                  onTap: () {},
                  child:
                      Image.asset("assets/flags.jpg", width: 150, height: 150),
                )
              ],
            )
          ],
        ),
      ],
    ));
  }
}
