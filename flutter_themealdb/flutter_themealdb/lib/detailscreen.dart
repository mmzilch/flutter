import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  @override
  Widget build(BuildContext context) {
    //final Articles args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Everything News'),
      ),
      body: Column(
        children: [
        // Image.network(args.urlToImage, width: 200, height: 200),
        // Text(args.title,
        //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        // const SizedBox(height: 20),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: <Widget>[Text(args.author), Text(args.publishedAt)],
        // ),
        // Text(args.description),
      ]),
    );
  }
}