import 'package:flutter/material.dart';
import 'package:calendar/homepage.dart';
import 'package:calendar/drawer.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  // This widget is the root of your application.
  @override
  
  Widget build(BuildContext context) {
    return new MaterialApp(
      title:'Calendar',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Home(),//CalHome(), 
    );
  }
}
