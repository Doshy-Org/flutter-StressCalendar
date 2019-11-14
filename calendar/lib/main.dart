//TODO: Blocky date ui on journal page, Months on journal page, blocks for each day on journal and add event for other days/
//TODO: list all days

import 'package:flutter/material.dart';
import 'package:calendar/drawer.dart';
import 'package:flutter/services.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  // This widget is the root of your application.
  @override
  
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromRGBO(250, 250, 250, 1), // navigation bar color
      //statusBarColor: Color.fromRGBO(250, 250, 250, 1), // status bar color
      //statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    
    return new MaterialApp(
      title:'Calendar',
      theme: ThemeData(
        brightness: Brightness.dark,

        primaryColor: Colors.blue,
      ),
      home: MyHomePage(),//CalHome(), 
    );
  }
}
