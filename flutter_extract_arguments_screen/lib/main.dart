import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(title: 'Extract',
    home: HomeScreen(),
    routes: {ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen()},
    )
    
    );
}

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(onPressed: (){
              Navigator.pushNamed(
                context, ExtractArgumentsScreen.routeName ,
                arguments: ScreenArguments('Extract Args', 'message from Extract Args')
                );
            },
            child: Text('Screen extract with Extract Arguments')),

            RaisedButton(onPressed: (){

            },
            child: Text(''),)
        ],)
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class ExtractArgumentsScreen extends StatelessWidget {

  static const routeName = '/extractArgument';
  
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(args.title)),
      body: Center(child: Text(args.message),
      ),
    );
  }
}
