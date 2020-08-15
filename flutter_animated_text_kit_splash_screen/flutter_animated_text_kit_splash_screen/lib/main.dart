import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Center(
            child: SizedBox(
      width: 250.0,
      child: ColorizeAnimatedTextKit(
          onTap: () {
            print("Tap Event");
          },
          text: [
            "Jasmine",
            "Rose",
            "Lily",
          ],
          textStyle: TextStyle(fontSize: 50.0, fontFamily: "Horizon"),
          colors: [
            Colors.purple,
            Colors.blue,
            Colors.yellow,
            Colors.red,
          ],
          textAlign: TextAlign.center,
          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
          ),
    )));
  }
}
