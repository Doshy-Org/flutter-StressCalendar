import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title:'Calendar',

      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[150],
          title: Text('Stress Calendar')
        ),
        body: Center(
          child: Text('Calendar Coming Soon'),
        ),
      ),
    );
  }
}
