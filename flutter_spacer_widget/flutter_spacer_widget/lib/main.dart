import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spacer Widget',
      home: Scaffold(
        appBar: AppBar(title: Text("Spacer"),),
        body: SpacerWidget(),
      ),
    );
  }
}


class Bluebox extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.cyan,
          border: Border.all(),
        ),
    );
  }

}

class SpacerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Bluebox(),
        Spacer(flex: 1,),
        Bluebox(),
        Spacer(flex: 2,),
        Bluebox(),
      ],
    );
  }
}
