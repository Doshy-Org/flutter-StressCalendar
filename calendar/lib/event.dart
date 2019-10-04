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


class EventDisplay extends StatefulWidget{
  _EventDisplayState createState() => _EventDisplayState(); 
}

class _EventDisplayState extends State<EventDisplay> { //displays list of events
  EventList list;
  // const EventLi({Key key, this.eventlist}) : super(key: key);

  @override
  initState()
  {
    list = new EventList();
    super.initState();
  }
  

  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: new Column(
        children: <Widget>[
          new Row(  //put in another file xd
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text(list.getValue(0).getTitle(), textAlign: TextAlign.left, style: TextStyle(fontSize: 20),),
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


class FancyFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  FancyFab({this.onPressed, this.tooltip, this.icon});

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.pink[200],
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget add() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Colors.blue[400],
        onPressed:(){
          setState(() {
            
          });
        },
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
      
    );
  }

  Widget image() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Colors.blue[400],
        onPressed: null,
        tooltip: 'Image',
        child: Icon(Icons.dns),
      ),
    );
  }

  Widget inbox() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Colors.blue[400],
        onPressed: null,
        tooltip: 'Inbox',
        child: Icon(Icons.book),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 3.0,
            0.0,
          ),
          child: add(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: image(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: inbox(),
        ),
        toggle(),
      ],
    );
  }
}