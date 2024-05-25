import 'package:children_learning/translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'service.dart';

class API extends StatelessWidget {
  API({super.key});
  final textCont = TextEditingController();
  var ans = ''.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text("enter desired text"),
          SizedBox(
            height: 50,
          ),
          TextField(
            controller: textCont,
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () async {
                print("in button");
                if(!textCont.text.isEmpty) {
                  print("in cond");
                  final trans =await Service.getTranslation("Hello");
                  ans.value = trans?.responseData.translatedText ?? "couldn't translate";
                }
              },
              child: Text("translate")),
          SizedBox(
            height: 50,
          ),
          Obx(() {
            return Text(ans.value);
          })
        ],
      ),
    );
  }
}
