import 'package:flutter/material.dart';
import 'package:calendar/homepage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title:'Calendar',
  
      home: MyPageView(),//CalHome(), 
    );
  }
}
