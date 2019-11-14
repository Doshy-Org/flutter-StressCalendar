import 'package:flutter/material.dart';
import 'package:calendar/flutter_calendar_carousel.dart'
show CalendarCarousel;
import 'package:calendar/classes/event.dart';
import 'package:calendar/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:calendar/event.dart';

DateTime now = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
String formattedMonth = DateFormat('MMMM').format(now);

class Home extends StatefulWidget{
  _home createState() => _home();

}

CalendarCarousel _calendarCarouselNoHeader;

class _home extends State<Home>{
  
  @override
  Widget build(BuildContext context) {
     _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.teal,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      height: 420.0, //nice
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
        color: Colors.blue,
      ),
      todayButtonColor: Colors.yellow,
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
    );
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [const Color(0xff3B93EF), const Color(0xffEB00EB)],
      ),
    ),
  width: double.infinity,
    constraints: BoxConstraints.expand(),
      padding: EdgeInsets.only(left: 15, right: 15),
        child: ListView( 
           children: <Widget>[     
                Container(
                  child: Column(children: <Widget>[                 //header
                    Image.asset('assets/temp_bg.png'),
                    Text("Good Morning Calvin Chen <3 <3 <3 !!", 
                      textAlign: TextAlign.center, 
                      style: TextStyle(fontSize: 25), 
                    ),
                    Text("You have 5 tasks", 
                      textAlign: TextAlign.center, 
                      style: TextStyle(fontSize: 20,color: Colors.grey), 
                    ),
                  ],)
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  decoration: customcard(),
                  child: Column(
                    children: <Widget>[
                      Text(formattedMonth, style: TextStyle(fontSize: 21),),
                      new SizedBox(height: 10,),
                      _calendarCarouselNoHeader,
                    ],
                  ), 
                ),
                SizedBox(height: 50,)
           ],
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