import 'package:flutter/material.dart';
import 'package:calendar/event.dart';
import 'dart:math';
EventList list = new EventList();

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}
 
class TodoListState extends State<TodoList> {
  
  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        // itemBuilder will be automatically be called as many times as it takes for the
        // list to fill up its available space, which is most likely more than the
        // number of todo items we have. So, we need to check the index is OK.
        if(index < list.size()) {
          return _buildTodoItem(list.getValue(index), index);
        }
      },
    );
  }

  // Build a single todo item
  Widget _buildTodoItem(EventInstance ei, int index) {
    return new Card(
      child: new Row(
        children: <Widget>[
          new Text(ei.getTitle()+"\t"),
          new Text(ei.getDescription()),
          new Spacer(),
          new CircleButton(ei.getStress()),
          new CircleButton(ei.getImportance()),
        ],
      ),
    );
  }

  @override  

  Widget build(BuildContext context) {
    Random rng = new Random();
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          _buildTodoList(),
          Container( 
            child: TextField(
  decoration: InputDecoration(
    //border: InputBorder.none,
    hintText: 'Enter a search term'
  ),
),
          ),
        ],
      ),
      
      floatingActionButton: new FloatingActionButton(
        onPressed:(){    
          setState(() {
            _showModal();
            //list.addEvent(new EventInstance("reee", "owo", rng.nextInt(5)+1, rng.nextInt(5)+1));
            //print("press");
          });
        },
        tooltip: 'Add task',
        child: new Icon(Icons.add)
      ),
    );
  }
    void _showModal() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new ListTile(
                leading: new Icon(Icons.grid_on),
                title: new Text('Journal'),
                onTap: () {
                  
                  Navigator.pop(context);
                },
              ),
              new ListTile(
                leading: new Icon(Icons.calendar_today),
                title: new Text('Home'),
                onTap: () {
                  
                  Navigator.pop(context);
                },
              ),
              new ListTile(
                leading: new Icon(Icons.list),
                title: new Text('Tasks'),
                onTap: () {
                
                  Navigator.pop(context);
                },
              ),
              new ListTile( //not complete
                leading: new Icon(Icons.settings),
                title: new Text('Options'),
                onTap: () {
                  
                  Navigator.pop(context);
                },
              ),
              
            ],
          );
        });
  }
}


////////////////////https://medium.com/flutter-community/flutter-beginners-guide-to-using-the-bottom-sheet-b8025573c433