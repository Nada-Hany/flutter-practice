import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'metro.dart';
import 'path_page.dart';

class HomePage extends StatelessWidget {
  var start = 'el marg'.obs;
  var dest = ' '.obs;

  final m = MetroStation();

  @override
  Widget build(BuildContext context) {
    List<String> stations = [];
    stations.addAll(m.thirdLine);
    stations.addAll(m.firstLine);
    stations.addAll(m.secondLine);

    //  stations = stations.distinct().toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Metro",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red[800],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Image.asset(
            "assets/metro.png",
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 70,
          ),
          Obx(() {
            return DropdownButton<String>(
              onChanged: (String? v) {
                start.value = v ?? 'please select';
              },
              value: start.value,
              isExpanded: true,
              items: stations
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
            );
          }),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    final metro = MetroStation();

                    //invalid stations
                    // if (metro.validStations(startText.text, destText.text) ==
                    //     false) {
                    //   Get.snackbar('Error', 'enter valid stations');
                    // } else {
                    //  final player = AudioCache
                    final player = AudioPlayer();
                    await player.play(UrlSource('assets/beep.wav'));
                    Get.to(PathPage(),
                        transition: Transition.leftToRight,
                        arguments: [start.value, dest.value]);
                    // }
                  },
                  child: Text("calculate")),
              SizedBox(
                width: 20,
              ),
              /*InkWell(
                onTap: () {
                  final metro = MetroStation();
                  if (metro.validStations(startText.text, destText.text) ==
                          false ||
                      startEntered.value == false ||
                      destEntered.value == false) {
                    Get.snackbar('Error', 'enter valid stations');
                  } else {
                    final tmp = startText.text;
                    startText.text = destText.text;
                    destText.text = tmp;
                    // Get.to(PathPage(),
                    //     transition: Transition.leftToRight,
                    //     arguments: [startText.text, destText.text]);
                  }
                },
                child: Image.asset(
                  "assets/swap.png",
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                ),
              )*/
            ],
          )
        ],
      ),
    );
  }
}
