import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro_app/metro.dart';

class PathPage extends StatelessWidget {
  var leftOutput = ''.obs;
  var rightOut = ''.obs;

  @override
  Widget build(BuildContext context) {
    final stations = Get.arguments as List<String>;
    final startStation = stations[0];
    final destStation = stations[1];
    final metro = MetroStation();
    leftOutput.value = metro.getPath(startStation, destStation);
    return Scaffold(
      appBar: null,
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Column(
                children: [
                  Obx(() {
                    return Text(
                      leftOutput.value,
                    );
                  })
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text(rightOut.value)],
              ),
            ),
          )
        ],
      ),
    );
  }
}
