import 'package:flutter/material.dart';
import 'package:calendar/classes/event.dart';
class event extends StatefulWidget{
  _event createState() => _event();

}

class _event extends State<event>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
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
                    // if (_pageController.hasClients) {
                    //   _pageController.animateToPage(
                    //     0,
                    //     duration: const Duration(milliseconds: 400),
                    //     curve: Curves.easeInOut,
                    //   );
                    // }
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
                       // child: new EventDisplay(),
                    ),
                  ],
                  
                ),
              )
            ]
          )
    );
  }


}

 BoxDecoration customcard(){
  return BoxDecoration(
    border: Border.all(
      color: Color.fromRGBO(234, 234, 234,1), //gray
      width: 2,
    ),
  
    borderRadius: new BorderRadius.all(const Radius.circular(20.0)),
  );
}