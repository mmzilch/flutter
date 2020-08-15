import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Pass args',
    onGenerateRoute: (settings){
      if(settings.name == PassArguments.routeName){
        final ScreenArguments args = settings.arguments;
        return MaterialPageRoute(builder: (context){
          return PassArguments(title: args.title, message: args.message);
        });
      }
    },
    home: HomeScreen(),
  ));
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: RaisedButton(child: Text('Extract Args'),
        onPressed: (){
          Navigator.pushNamed(context, PassArguments.routeName,
          arguments: ScreenArguments('Pass args', 'message from pass args'));
        },)
      ),
    );
  }
}

class PassArguments extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String message;

  const PassArguments(
    {
      Key key,
       @required this.title,
       @required this.message
      }
      ) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(message),),
    );
  }
}