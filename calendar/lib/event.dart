import 'package:flutter/material.dart';

BoxDecoration customcard(){
  return BoxDecoration(
    border: Border.all(
      color: Color.fromRGBO(234, 234, 234,1),
      width: 2,
    ),
  
    borderRadius: new BorderRadius.all(const Radius.circular(20.0)),
  );
}

class EventLi extends StatelessWidget {
  // final String name;
  // final int i;
  // final int s;
  const EventLi({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 50.0;

    return Container(
      child: new Column(
        children: <Widget>[
          new Row(  //put in another file xd
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text("owo", textAlign: TextAlign.left, style: TextStyle(fontSize: 20),),
            SizedBox(),
            SizedBox(),  //xd idk abt this
            SizedBox(),
            
            Text(".", textAlign: TextAlign.right, style: TextStyle(fontSize: 24),),
          ],
          ),
        ],
      ),
    );
  }
}



class EventList{
  @override
  List<NewEvent> events;
  
  EventList()
  {
    events = new List<NewEvent>();
  }

  void addEvent(NewEvent ree)
  {
    events.add(ree);
  }

  void deleteEvent(NewEvent ree)
  {
    events.remove(ree);
  }
  int size()
  {
    return events.length;
  }


}  
class NewEvent
{
  String eventTitle; 
  String eventDescription;
  int stress; //percieved stress
  int actualStress; //experienced stress
  int importance;
  NewEvent(String title, String descip, int s, int i)
  {
    eventTitle = title;
    eventDescription = descip;
    stress = s;
    importance = i;
  }
  
  int getStress(){
    return stress;
  }

  int getImportance(){
    return importance;
  }

  String getTitle()
  {
    return eventTitle;
  }

  String getDescription()
  {
    return eventDescription;
  }

  int getActualStress()
  {
    return actualStress;
  }

  void editTitle(String newTitle)
  {
    eventTitle=newTitle;
  }

  void editDescription(String newDescription)
  {
    eventDescription=newDescription;
  }

  void editStress(int newStress)
  {
    stress = newStress;
  }

  void editImportance(int newImportance)
  {
    importance=newImportance;
  }

  void editActualStress(int newActual)
  {
    actualStress = newActual;
  }
}

