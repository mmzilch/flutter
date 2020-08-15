import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return MaterialApp(title: 'Button with Function',
    home: Scaffold(appBar: AppBar(title: Text('Button'),
    ),
    body: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buttonWithFunCall(color, Icons.favorite, 'Favourite'),
            buttonWithFunCall(color, Icons.lock, 'Lock'),
            buttonWithFunCall(color, Icons.memory, 'Memory')
        ],),
        Image.asset('images/profile.jpg',width : 100, height: 100)
      ]
    ),
    ),
    );
  }
}

Column buttonWithFunCall(Color color, IconData icon, String label){
  return Column(children: <Widget>[
Icon(icon, color: color,),
Text(label, style: TextStyle(color: color, fontSize: 12,fontWeight: FontWeight.w400),)
  ],
  );
}
