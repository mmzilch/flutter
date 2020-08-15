import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:  FirstRoute(),
   ));
}

class FirstRoute extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Navigate with route'),
        ),
        body: Center(
          child: RaisedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondRoute()));
          },
          child: Text('Next'),
          ),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Route'),
      ),
      body: Center(child: RaisedButton(onPressed: (){
        Navigator.pop(context);
      },
      child: Text('Back To First Route'),),),
    );
  }
}
