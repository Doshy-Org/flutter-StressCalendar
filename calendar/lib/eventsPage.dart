import 'package:calendar/classes/event.dart';
import 'package:flutter/material.dart';
import 'package:calendar/event.dart';

class eventsPage extends StatefulWidget{
  @override
  State createState() => new _eventsPageState();
}
class _eventsPageState extends State<eventsPage>  {

  EventList events = new EventList();

  @override
   void initState() {
    super.initState();
    events.addEvent(new EventInstance("ree","ree",1,1));
  }
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
                            new Row(  //put in another file xd
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                            Text("do stuff", textAlign: TextAlign.left, style: TextStyle(fontSize: 20),),
                            Spacer(),
                            new CircleButton(onTap: () => print("Cool")),
                            new SizedBox(width:30),
                            new CircleButton(onTap: () => print("Cool")),
                          ],
                          ),
                          new Row(  //put in another file xd
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                            Text("rocks", textAlign: TextAlign.left, style: TextStyle(fontSize: 20),),
                            Spacer(),
                            new CircleButton(onTap: () => print("Cool")),
                            new SizedBox(width:30),
                            new CircleButton(onTap: () => print("Cool")),
                          ],
                          ),
                          new Row(  //put in another file xd
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                            Text("yes", textAlign: TextAlign.left, style: TextStyle(fontSize: 20),),
                            Spacer(),
                            new CircleButton(onTap: () => print("Cool")),
                            new SizedBox(width:30),
                            new CircleButton(onTap: () => print("Cool")),
                          ],
                          ),
                          ],
                          
                        ),
                        /*child:new ListView.builder
                        (
                          itemCount: events.size(),
                          itemBuilder: (BuildContext ctxt, int index) {
                            print("index $index");
                            return new EventLi(even: events.getValue(index));
                            // return new EventLi(new EventInstance("ree","ree",1,1));
                          }
                        )*/
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
                            //new EventLi(),
                       
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
              events.addEvent(new EventInstance("oworeee","uwu",2,2));
            },
            child: Icon(Icons.add),
             backgroundColor: Colors.pink[200],
       ), 
    );


  }
}