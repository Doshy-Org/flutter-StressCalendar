import 'package:flutter/material.dart';
import 'package:calendar/event.dart';

class eventsPage extends StatelessWidget {

  EventList events = new EventList();
  
  @override
  Widget build(BuildContext ctxt)
  {//signals that enemies are missing
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
        Container(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 16.0),
          constraints: BoxConstraints.expand(),
          child: ListView(
            children: <Widget>[
              Container(
                child:  Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: <Widget>[
                  IconButton( //back button
                    icon:Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(ctxt).pop();
                    },
                  ), 
                  SizedBox(width:90, height: 0),
                  Text("Overview", textAlign: TextAlign.center,style:TextStyle(fontSize:25)),
                ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5, top: 5, right: 5),
                child: new Column(
                  children: <Widget>[
                    Divider(height: 4.0, color: Colors.black,),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      Text("Today", textAlign: TextAlign.left, style: TextStyle(fontSize: 24),),
                    ],),
                    SizedBox(height: 10,),
                    new Container(
                        decoration: customcard(),
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
                        child: new Column(
                          children: <Widget>[
                            
                              new EventLi(),

                              // for(int i = 0; i< events.size(); i++){
                              //   new EventLi();
                              // }
                          ],
                        ),
                    ),
                    SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      Text("Upcoming", textAlign: TextAlign.left, style: TextStyle(fontSize: 24),),
                    ],),
                    SizedBox(height: 10,),
                    new Container(
                        decoration: customcard(),
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
                        child: new Column(
                          children: <Widget>[
                            new Row(  //put in another file xd
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                              Text("Do Some Hw", textAlign: TextAlign.left, style: TextStyle(fontSize: 20),),
                              SizedBox(),
                              SizedBox(),  //xd idk abt this
                              SizedBox(),
                              
                              Text(".", textAlign: TextAlign.right, style: TextStyle(fontSize: 24),),

                              
                            ],
                            ),
                          ],
                        ),
                    ),

                    
                  ],
                  
                ),
              )
            ],
        
      
        ), 
        
      ),
      floatingActionButton: FloatingActionButton(
            onPressed:(){
              events.addEvent(new NewEvent("owo","uwu",2,2));
            },
            child: Icon(Icons.add),
             backgroundColor: Colors.pink[200],
       ), 
    );


  }
}