import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class Animals extends StatelessWidget {
  Animals({super.key});
  final animals = ["dog", "cat", "lion", "tiger", "butterfly"];
  final textCont = TextEditingController();
  var output = ''.obs;
  @override
  Widget build(BuildContext context) {
    animals.shuffle();
    var index = 0;
    return Scaffold(body: Column(children: [
     InkWell(onTap: (){
        FlutterTts tts = FlutterTts();
        tts.speak(animals[index]);
      }, child: Image.asset('assets/volume.png', height: 60, width: 60,),
      ),
    SizedBox(height: 30,),
      TextField(controller: textCont,textAlign: TextAlign.center,),
      SizedBox(height: 30,),
      ElevatedButton(onPressed: (){
        if(!textCont.text.isEmpty) {
                  if (textCont.text.toLowerCase() == animals[index]) {
                    output.value = "yay! right answer";
                    index++;
                    index %= animals.length;
                  }else
                    output.value = "try again'(";
        }
              }, child: Text("check")),
      SizedBox(height: 30,),
      Obx((){
        return Text(output.value);
      })
    ],mainAxisAlignment: MainAxisAlignment.center,)
      ,);
  }
}
