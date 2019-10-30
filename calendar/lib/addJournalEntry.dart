import 'package:flutter/material.dart';
import 'package:calendar/journalPage.dart';
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
  final Map<String, String> journalEntryForm =
  {
    'journal_title': "ree",
    'journal_entry': "owo",
  };

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
      journalEntryForm['journal_title'] = title;
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
      journalEntryForm['journal_entry'] = entry;
    },
    decoration: InputDecoration(hintText: 'Your Journal Entry'),
  );
}
Widget build(BuildContext ctxt)
  {
    return Scaffold
    (
      appBar: AppBar(
        title: Text('Create Journal'),
        backgroundColor: Colors.pinkAccent,
        actions: <Widget>[
        ],
      ),
      body: page(ctxt),

      floatingActionButton: FloatingActionButton(
          elevation: 6.0,
          onPressed: () {
            journals.add(journalEntryForm);
          },
          child: Icon(Icons.edit),
          backgroundColor: Theme.of(context).primaryColor,
        ),
    );
  }
}