import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Buttons Widget'),),
        body: ButtonWidget(),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
          RaisedButton(onPressed: null,
          child: Text('Disabled Btn', 
          style: TextStyle(fontSize: 20),),
          ),
          RaisedButton(onPressed: (){},
          child: Text('Enabled Btn', 
          style: TextStyle(fontSize: 20),),
          ),
          RaisedButton(onPressed: (){}, 
          textColor: Colors.lightBlue,
           child: Container(
             decoration: BoxDecoration(
               gradient: LinearGradient(
                 colors: 
               [
               Color(0xFFEEFF41),
               Color(0xFFC6FF00),
              Color(0xFFAEEA00),
             ]),
             ),
            padding: EdgeInsets.all(10.0),
            child: Text('Gradiant Btn',
            style: TextStyle(fontSize: 20),
            ),
           ),
          ),
      ]),
    );
  }
}
