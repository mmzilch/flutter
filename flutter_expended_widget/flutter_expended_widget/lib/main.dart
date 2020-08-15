import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expanded Widget',
      home: Scaffold(
        appBar: AppBar(title: Text('Expanded'),
        ),
        body: ExpandedWidget(),
      ),
    );
  }
}

class Bluebox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height:50,
      decoration: BoxDecoration(color: Colors.blue,
      border: Border.all())
    );
  }
}

class ExpandedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Bluebox(),
        Expanded(child: Bluebox()),
        Bluebox(),
      ],
    );
  }
}