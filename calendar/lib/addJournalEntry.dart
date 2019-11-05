import 'package:calendar/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:calendar/journalPage.dart';
import 'package:calendar/journalEntry.dart';

class addJournalEntry extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return _addJournalEntryState();
  }
}

class _addJournalEntryState extends State<addJournalEntry>
{
  String journal_title = "";
  String journal_entry = "";
  String journal_date = formattedDate;

  final GlobalKey<FormState> _addJournalGlobalKey = GlobalKey<FormState>();

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
        key: _addJournalGlobalKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal : paddingAmount/2),
          children: <Widget>[
            
            //build title text field
            _buildTitle(),
            //build journal text field
            _buildEntry(),

          ],
        ),
      ),
    ),
  );

}

Widget _buildTitle()
{
  return TextFormField
  (
    validator : (String title)
    {
      if(title.isEmpty)
      {
        return 'Title Required';
      }
    },
    onSaved: (String title)
    {
      journal_title = title;
    },
    decoration: InputDecoration(hintText: 'Your Title'),
  );
}

Widget _buildEntry()
{
  return TextFormField
  (
    validator : (String entry)
    {
      if(entry.isEmpty)
      {
        return 'Journal Entry Required';
      }
    },
    onSaved: (String entry)
    {
      print("saved");
      journal_entry = entry;
    },
    decoration: InputDecoration(hintText: 'Your Journal Entry'),
  );
}
Widget build(BuildContext ctxt)
  {
    return Scaffold
    (
      appBar: AppBar(
        title: Text('Create Journal',
                    style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black54,
        actions: <Widget>[
        ],
      ),
      body: page(ctxt),

      floatingActionButton: FloatingActionButton(
          elevation: 6.0,
          onPressed: () {
            if(_addJournalGlobalKey.currentState.validate())
            {
              _addJournalGlobalKey.currentState.save();
              journals.add(new journalEntry(journal_title,journal_entry,journal_date));
              // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
              //   return journalPage();
              // })).then((_) {

              // });
              Navigator.pop(context); 
            }
          },
          child: Icon(Icons.check),
          backgroundColor: Theme.of(context).primaryColor,

         
        ),
    );
  }
}