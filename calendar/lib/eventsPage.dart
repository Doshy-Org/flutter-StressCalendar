import 'package:flutter/material.dart';
import 'package:calendar/event.dart';
import 'dart:math';
EventList list = new EventList();
int tempStress;
int tempImport;
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
    return new Scaffold(
      body: 
          _buildTodoList(),
      
      floatingActionButton: new FloatingActionButton(
        onPressed:(){    
          setState(() {
            _showInput();
            //list.addEvent(new EventInstance("reee", "owo", rng.nextInt(5)+1, rng.nextInt(5)+1));
            //print("press");
          });
        },
        tooltip: 'Add task',
        child: new Icon(Icons.add)
      ),
    );
  }
    void _showInput() {
    showModalBottomSheet<void>(
      
        context: context,
        builder: (BuildContext context) {
           return new TextField(
              autofocus: true,
              onSubmitted: (val) {
                setState(() {
                   list.addEvent(new EventInstance(val, val, 0, 0));
                });
               
                Navigator.pop(context); // Close the add todo screen
              },
              decoration: new InputDecoration(
                hintText: 'Enter something to do...',
                contentPadding: const EdgeInsets.all(16.0)
              ),
        );
  }
    );
}
}
