import 'package:flutter/material.dart';
import 'package:calendar/event.dart';
  class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  
  List<String> _todoItems = [];
    Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        // itemBuilder will be automatically be called as many times as it takes for the
        // list to fill up its available space, which is most likely more than the
        // number of todo items we have. So, we need to check the index is OK.
        if(index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index], index);
        }
      },
    );
  }

  // Build a single todo item
  Widget _buildTodoItem(String todoText, int index) {
    return new ListTile(
      title: new Text(todoText),
    );
  }

  @override  
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(
        onPressed:(){    
          setState(() {
            _todoItems.add("value");
            print("press");
          });
        },
        tooltip: 'Add task',
        child: new Icon(Icons.add)
      ),
    );
  }
}