import 'package:flutter/material.dart';
//import 'package:calendar/calendar.dart';
//import 'calendar/index.dart';

import 'package:calendar/eventsPage.dart';
//import 'package:flutter/material.dart';

import 'package:calendar/flutter_calendar_carousel.dart'
show CalendarCarousel;
import 'package:calendar/classes/event.dart';
import 'package:calendar/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;

class CalHome extends StatefulWidget {
  @override 
  _CalHomeState createState() => _CalHomeState();
  //List<int> tempArray = new List();
}
 CalendarCarousel _calendarCarouselNoHeader;
class _CalHomeState extends State<CalHome>{
 
  @override
  Widget build (BuildContext ctxt) {
     _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.green,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      height: 420.0,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      markedDateMoreShowTotal:
          false, // null for not showing hidden events indicator
      showHeader: false,
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      todayTextStyle: TextStyle(
        color: Colors.indigo[900],
      ),
      todayButtonColor: Colors.pink[100],
      selectedDayTextStyle: TextStyle(
        color: Colors.pink[100],
      ),
  );
    return new Scaffold(
      body: (
        Center(
          child: Container(
          width: double.infinity,
          constraints: BoxConstraints.expand(),
          child: ListView(
            children: <Widget>[
              Container(
                child: Column(children: <Widget>[
                  Image.asset('assets/temp_bg.png'),
                  Text("Good Morning StresDevs", 
                    textAlign: TextAlign.center, 
                    style: TextStyle(fontSize: 25), 
                  ),
                  Text("You have 5 tasks today", 
                    textAlign: TextAlign.center, 
                    style: TextStyle(fontSize: 20,color: Colors.grey), 
                  ),
                ],)
              ),
              Container(
                child: SizedBox(height:45), 
                //this is space between Good Morning and Calendar
              ),
              Container(
                child: _calendarCarouselNoHeader,
              ),

              Container(
                child: MaterialButton(
                  child: Text("View Details"),
                  color: Colors.pink[200],
                  shape: StadiumBorder(),
                  elevation: 2,
                  onPressed: (){
                    Navigator.push(
                      ctxt,
                      SlideRightRoute(page: eventsPage()),
                    );
                  }
                ),
              ),
              //new TempCal(title: "ree",),
              // ListView.builder(
              //   itemCount: tempArray.length,
              //   itemBuilder: (BuildContext context, int index){
              //     return Card(
              //       child: Column(children: <Widget>[
              //         const ListTile(
              //             title: Text("Month Name index"),
              //           ),
              //         ],),
              //       );
              //   }
              // )
            ],
          ),
             
         ),
        )    
      )
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
        );
}




