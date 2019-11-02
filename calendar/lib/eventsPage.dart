import 'package:flutter/material.dart';
import 'package:calendar/event.dart';
EventList list = new EventList();
double  tempStress;
int tempImport;

String tempTitle;
String tempDesc;
//global ints for temp use
final GlobalKey<FormState> _addEventFormKey = GlobalKey<FormState>();

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
      return new Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: new Row(
                children: <Widget>[
                  new Text(ei.getTitle(), style: TextStyle(fontSize: 20),),
                 // new Text(ei.getDescription()),
                  new Spacer(),
                  new CircleButton(ei.getStress()),
                  new SizedBox(width: 10),
                  new CircleButton(ei.getImportance()),
                ],
            ),
          ),
          Divider(),
        ],
      );
     
     
  }

  @override  

  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: new Text("To Do List", style: TextStyle(color: Colors.black),),
      ),
      body: 
          _buildTodoList(),
      
      floatingActionButton: new FloatingActionButton(
        onPressed:(){    
          setState(() {
            tempTitle = "";
            tempDesc = "";
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
      isScrollControlled:true,
        context: context,
        builder: (BuildContext context) {
          return new Container(  
            height: MediaQuery.of(context).size.height*0.80,
            color: Color(0xFF737373),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: new BoxDecoration( 
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(10.0),
                  topRight: const Radius.circular(10.0)),
              ),

              child:  Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  Text("Add Task", style: new TextStyle(fontSize: 22),),

                  Form(
                    key:_addEventFormKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          autofocus: true,
                          decoration: new InputDecoration(
                            hintText: 'Enter something to do...',
                            contentPadding: const EdgeInsets.all(16.0)
                          ),
                          onSaved: (String title){
                            tempTitle = title;
                            print("saved");
                          },
                        ),
                        TextFormField(
                          decoration: new InputDecoration(
                            hintText: 'Enter Description',
                            contentPadding: const EdgeInsets.all(16.0)
                          ),
                          onSaved: (String title){
                            tempDesc = title;
                          },
                        ),
                        
                      ],
                    ),
                  ),
                  // new Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: <Widget>[
                  //       new IconButton(
                  //         icon: new Icon(Icons.radio_button_unchecked, color: Colors.green,),                
                  //         color: Colors.green,
                  //         onPressed:(){
                  //           setState(() {
                  //             tempStress =1;
                  //           });
                  //         } 
                  //       ),
                  //       new IconButton(
                  //         icon: new Icon(Icons.radio_button_unchecked, color: Colors.lime,),  
                  //         color: Colors.lime,
                  //         onPressed:(){
                  //           setState(() {
                  //             tempStress =2;
                  //           });
                  //         } 
                  //       ),
                  //       new IconButton(
                  //         icon: new Icon(Icons.radio_button_unchecked, color: Colors.yellow,),
                  //         color: Colors.yellow,
                  //         onPressed:(){
                  //           setState(() {
                  //             tempStress =3;
                  //           });
                  //         } 
                  //       ),
                  //       new IconButton(
                  //         icon: new Icon(Icons.radio_button_unchecked, color: Colors.orange,),
                  //         color: Colors.orange,
                  //         onPressed:(){
                  //           setState(() {
                  //             tempStress =4;
                  //           });
                  //         } 
                  //       ),
                  //       new IconButton(
                  //         icon: new Icon(Icons.radio_button_unchecked, color: Colors.red,),
                  //         color: Colors.red,
                  //         onPressed:(){
                  //           setState(() {
                  //             tempStress =5;
                  //           });
                  //         } 
                  //       ),
                  //     ],
                  //   ),
                  Slider(min: 0.0, max: 5.0, divisions: 5, value: tempStress, onChanged:(double val){
                    setState(() {
                     tempStress = val; 
                    });
                  } ,),
                    FlatButton(
                      child: Text("Add", style: new TextStyle(color: Colors.blue),),
                      onPressed: (){
                        setState(() {
                          _addEventFormKey.currentState.save();
                          list.addEvent(new EventInstance(tempTitle, tempDesc, 0, 0));
                      });
                      Navigator.pop(context); // Close 
                      },
                    ),
                  ],   
                ),
              ), 
          );   
       }
    );
  }
}

