import 'package:flutter/material.dart';
import 'package:calendar/eventsPage.dart';
import 'package:calendar/mainpage.dart';
import 'package:calendar/journalPage.dart';
import 'package:calendar/event.dart';
import 'package:calendar/addJournalEntry.dart';

class _Page {
  _Page({this.widget});
  final StatefulWidget widget;
}

List<_Page> _allPages = <_Page>[
  _Page(widget: journalPage()),
  _Page(widget: Home()),
  _Page(widget: TodoList()),
  //_Page(widget: addJournalEntry()),
];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
      
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: _allPages.length);
    _controller.animateTo(1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      /*floatingActionButton: FloatingActionButton(
        elevation: 4.0,
       child: Icon(Icons.add),
        //icon: const Icon(Icons.add),
        //label: const Text('Add'),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,*/
      body: Stack(
        children: <Widget>[
           TabBarView(
          controller: _controller,
          children: _allPages.map<Widget>((_Page page) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Container(
                  key: ObjectKey(page.widget),
                  child: page.widget),
            );
          }).toList()),

        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            width: 50,
            color: Colors.blue.withOpacity(0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    _showModal();
                  }
                ),
              ],
            ),
          ),
        ),
      
        ],
      ) 
     
      
    );
  }

  void _showModal() {
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        builder: (BuildContext context) {
          return new Container(
          
            padding: EdgeInsets.all(10),
            child: Container(
              //padding: EdgeInsets.all(10),
              decoration: new BoxDecoration( 
                color: Colors.white,
                borderRadius: new BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.grid_on),
                  title: new Text('Journal'),
                  onTap: () {
                    _controller.animateTo(0);
                    Navigator.pop(context);
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.calendar_today),
                  title: new Text('Home'),
                  onTap: () {
                    _controller.animateTo(1);
                    Navigator.pop(context);
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.list),
                  title: new Text('Tasks'),
                  onTap: () {
                    _controller.animateTo(2);
                    Navigator.pop(context);
                  },
                ),
                new ListTile( //not complete
                  leading: new Icon(Icons.settings),
                  title: new Text('Options'),
                  onTap: () {
                    _controller.animateTo(2);
                    Navigator.pop(context);
                  },
                ),
                ],
              ),
            ),
          );
        });
  }
}