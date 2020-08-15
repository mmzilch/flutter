import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen.navigate(
        name: 'assets/Cosmos.flr',
        next: (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        until: () => Future.delayed(Duration(seconds: 5)),
        startAnimation: '0',
        endAnimation: '4',
      ),
      // ignore: missing_required_param
      // home: SplashScreen.callback(
      //   name: 'Cosmos.flr',
      //   onSuccess: (_) {
      //     Navigator.of(context).pushReplacement(PageRouteBuilder(
      //         pageBuilder: (_, __, ___) =>
      //             MyHomePage(title: 'Flutter Demo Home Page')));
      //   },
      //   loopAnimation: '1',
      //   until: () => Future.delayed(Duration(seconds: 1)),
      //   endAnimation: '1',
      // ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
