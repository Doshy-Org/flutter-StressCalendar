
import 'package:flutter/material.dart';
import 'package:calendar/flutter_calendar_carousel.dart'
show CalendarCarousel;
import 'package:calendar/classes/event.dart';
import 'package:calendar/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:calendar/event.dart';

class MyPageView extends StatefulWidget {
  MyPageView({Key key}) : super(key: key);

  _MyPageViewState createState() => _MyPageViewState();
}

CalendarCarousel _calendarCarouselNoHeader;

class _MyPageViewState extends State<MyPageView> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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

    return MaterialApp(
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          children: [
          Container(
            width: double.infinity,
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.only(left: 15, right: 15),
            child: ListView( 
              children: <Widget>[
                Container(
                  child: Column(children: <Widget>[                 //header
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
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  decoration: customcard(),
                  child: Column(
                    children: <Widget>[
                      Text("September", style: TextStyle(fontSize: 21),),
                      new SizedBox(height: 10,),
                      _calendarCarouselNoHeader,
                    ],
                  ) 
                ),
                Container(
                  child: MaterialButton(
                    child: Text("View Details"),
                    color: Colors.pink[200],
                    shape: StadiumBorder(),
                    elevation: 2,
                    onPressed: () {
                      if (_pageController.hasClients) {
                        _pageController.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),  
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
                    if (_pageController.hasClients) {
                      _pageController.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
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
                        child: new EventDisplay(),
                    ),
                  ],
                  
                ),
              )
            ],
        
      
        ), 
        
            )
          ],
        ),
        //expanding pink button on the bottom right 
        floatingActionButton: FancyFab(    
            onPressed:(){
              //events.addEvent(new EventInstance("oworeee","uwu",2,2));
            },
       ), 
      ),
      
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
