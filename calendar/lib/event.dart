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
  final EventInstance even;
  const EventLi({Key key, this.even}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: new Column(
        children: <Widget>[
          new Row(  //put in another file xd
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text(even.getTitle(), textAlign: TextAlign.left, style: TextStyle(fontSize: 20),),
            Spacer(),
            new CircleButton(onTap: () => print("Cool")),
            new SizedBox(width:30),
            new CircleButton(onTap: () => print("Cool")),
          ],
          ),
        ],
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  //final Color col;

  const CircleButton({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 20.0;
    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class EventList{
  @override
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
  int stress; //percieved stress
  int actualStress; //experienced stress
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

