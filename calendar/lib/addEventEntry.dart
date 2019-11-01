import 'package:flutter/material.dart';
import 'package:calendar/eventsPage.dart';
import 'package:calendar/event.dart';
class addEventEntry extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return _addEventEntryState();
  }
}

class _addEventEntryState extends State<addEventEntry>
{
  String name;
  String desc;
  int stress;
  int imp;

  final GlobalKey<FormState> _addEventGlobalKey = GlobalKey<FormState>();

Widget page(BuildContext ctxt)
{
  final double deviceWidth = MediaQuery.of(context).size.width;
  final double targetWidth =
   deviceWidth > 550.0 ? 500 : deviceWidth * 0.95;
  final double paddingAmount = deviceWidth - targetWidth;
   //translation:::
  //  if(deviceWidth > 550.0)
  //   targetWidth = 500;
  // else
  //   targetWidth = deviceWidth * 0.95;

  return GestureDetector
  (
    //keyboard closes when user taps outside of keyboard

    onTap:()
    {

    },

    child: Container
    (
      margin: EdgeInsets.all(10.0),
      child: Form(
        key: _addEventGlobalKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal : paddingAmount/2),
          children: <Widget>[
            
            //build title text field
            _buildName(),
            //build journal text field
            _buildDesc(),
            _buildStress(),
            _buildImp(),

          ],
        ),
      ),
    ),
  );

}

Widget _buildName()
{
  return TextFormField
  (
    validator : (String name)
    {
      if(name.isEmpty)
      {
        return 'Event Name Required';
      }
    },
    onSaved: (String name)
    {
      this.name = name;
    },
    decoration: InputDecoration(hintText: 'Event Name'),
  );
}

Widget _buildDesc()
{
  return TextFormField
  (
    validator : (String desc)
    {
      if(desc.isEmpty)
      {
        return 'Event Description Required';
      }
    },
    onSaved: (String entry)
    {
      this.desc = desc;
    },
    decoration: InputDecoration(hintText: 'Event Description'),
  );
}
Widget _buildStress()
{
  return TextFormField
  (
    validator : (String stress)
    {
      if(stress.isEmpty)
      {
        return 'Stress Level Required';
      }
    },
    onSaved: (String stress)
    {
      this.stress = int.parse(stress);
    },
    decoration: InputDecoration(hintText: 'Event Stress'),
  );
}
Widget _buildImp()
{
  return TextFormField
  (
    validator : (String imp)
    {
      if(imp.isEmpty)
      {
        return 'Importance Level Required';
      }
    },
    onSaved: (String imp)
    {
      this.imp = int.parse(imp);
    },
    decoration: InputDecoration(hintText: 'Event Importance'),
  );
}
Widget build(BuildContext ctxt)
  {
    return Scaffold
    (
      appBar: AppBar(
        title: Text('Create Event Entry',
                    style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black54,
        actions: <Widget>[
        ],
      ),
      body: page(ctxt),

      floatingActionButton: FloatingActionButton(
          elevation: 6.0,
          onPressed: () {
            // if(_addJournalGlobalKey.currentState.validate())
            // {
              _addEventGlobalKey.currentState.save();
              list.addEvent(new EventInstance(name,desc,stress,imp));
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                return TodoList();
              })).then((_) {

              });
            // }
          },
          child: Icon(Icons.check),
          backgroundColor: Theme.of(context).primaryColor,

         
        ),
    );
  }
}