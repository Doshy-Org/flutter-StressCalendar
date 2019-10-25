import 'package:flutter/material.dart';
import 'package:calendar/event.dart';

EventList list = new EventList();

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}
 
class TodoListState extends State<TodoList> {
  
  
  //should be on drawer page for correct access stuff


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
          new Text(ei.getTitle()),
          new Text(ei.getDescription()),
          new CircleButton(ei.getImportance()),
          new CircleButton(ei.getStress()),
          new CircleButton(3),
          new CircleButton(4),
          new CircleButton(5),

        ],
      ),
    );
  }

  @override  

  Widget build(BuildContext context) {
    return new Scaffold(
      body:
        new Container(
          child: Column(
            children: <Widget>[
              new TextField(
                decoration: InputDecoration(
                  hintText: 'Enter a search term'
                ),
              ),
             new Container(
               child:  _buildTodoList(),
             ),
            
            ],
          )
        ),
      
      floatingActionButton: new FloatingActionButton(
        onPressed:(){    
          setState(() {
            list.addEvent(new EventInstance("reee", "owo", 1, 2));
            print("press");
          });
        },
        tooltip: 'Add task',
        child: new Icon(Icons.add)
      ),
    );
  }
}