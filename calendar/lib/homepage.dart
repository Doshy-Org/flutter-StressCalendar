import 'package:flutter/material.dart';
import 'package:calendar/calendar.dart';

class CalHome extends StatelessWidget {
  var rows;
  List<int> tempArray = new List();
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      body: (
        Center(
          child: Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.only(top: 30),
          width: double.infinity,
          constraints: BoxConstraints.expand(),
          child: ListView(
            children: <Widget>[
              Container(
                child: Column(children: <Widget>[
                  Image.asset('assets/temp_bg.png'),
                  Text("Good Morning StresDevs", 
                    textAlign: TextAlign.center, 
                    style: TextStyle(fontSize: 25,), 
                  ),
                  Text("You have 5 tasks today", 
                    textAlign: TextAlign.center, 
                    style: TextStyle(fontSize: 20,color: Colors.grey), 
                  ),
                ],)
              ),
              Padding(   //calendar goes here, make into seperate object so we can generate
                padding: const EdgeInsets.only(top: 20),
              ),
              ListView.builder(
                itemCount: tempArray.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    child: Column(children: <Widget>[
                      const ListTile(
                          title: Text("Month Name index"),
                        ),
                      ],),
                    );
                }
              )
            ],
          ),
             
         ),
        )    
      )
    );
  }
}



