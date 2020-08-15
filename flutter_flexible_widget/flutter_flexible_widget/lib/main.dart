import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flexible widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flexible'),
      ),
      body: FlexibleWidget(),
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
      decoration: BoxDecoration(color:Colors.cyan,border: Border.all() )
    );
  }
}

class FlexibleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Bluebox(),
        Flexible(
          child: Bluebox(),
        flex: 3,
        fit: FlexFit.loose
        ),
        Flexible(
          child: Bluebox(),
        flex:2,
        fit: FlexFit.tight),
      ],
    );
  }
}