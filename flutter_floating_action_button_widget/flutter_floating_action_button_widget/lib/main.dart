import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floating Action Button',
      home: Scaffold(
        appBar: AppBar(
          title: Text('FAB'),
        ),
        body: SpacerWidget(),
        floatingActionButton: FABWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(),
        ));
  }
}

class FABWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: null,
      tooltip: "Add",
      child: Icon(Icons.add)
    );
  }
}

class SpacerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(children: [
        BlueBox(),
        Spacer(flex: 1),
        BlueBox(),
        Spacer(flex: 2),
        BlueBox(),
    ],);
  }

}
