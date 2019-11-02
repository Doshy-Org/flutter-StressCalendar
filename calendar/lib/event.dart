import 'package:flutter/material.dart';
 
BoxDecoration customcard(){
  return BoxDecoration(
    border: Border.all(
      color: Color.fromRGBO(234, 234, 234,1.0),
      width: 2.0,
    ),
    borderRadius: new BorderRadius.all(const Radius.circular(20.0)),
  );
}


class CircleButton extends StatelessWidget {
  //  final GestureTapCallback onTap;
  final int col;
  //  const CircleButton({Key key, /*this.col,*/ this.onTap}) : super(key: key);
  const CircleButton(this.col);
  
  @override
  Widget build(BuildContext context) {
    Color coll;
     double size = 21.0;
    switch (col) {
      case 1: coll = Colors.green; break;
      case 2: coll = Colors.lime; break;
      case 3: coll = Colors.yellow; break;
      case 4: coll = Colors.orange; break;
      case 5: coll = Colors.red; break;
      default: coll = Colors.black;
    }
    return new InkResponse(
      // onTap: onTap,
      child: new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: coll,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class EventList{
  //@override
  List<EventInstance> events;
  
  EventList()
  {
    events = new List<EventInstance>();
    events.add(new EventInstance("ree","ree",1,1));
  }

  void addEvent(EventInstance ree)
  {
    events.add(ree);
  }

  void deleteEvent(EventInstance ree)
  {
    events.remove(ree);
  }
  int size()
  {
    return events.length;
  }
  
  EventInstance getValue(int index)
  {
    return events[index];
  }


}  
class EventInstance
{
  String eventTitle; 
  String eventDescription;
  int stress; //percieved stress levels
  int actualStress; //experienced stress levels
  int importance;
  EventInstance(String title, String descip, int s, int i)
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