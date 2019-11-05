import 'package:flutter/material.dart';
import 'package:calendar/addJournalEntry.dart';
import 'package:calendar/journalEntry.dart';

class journalPage extends StatefulWidget{
  _journalPageState createState() => _journalPageState();

}
// List<Map<String, String>> journals = new List<Map<String,String>>();
List<journalEntry> journals = new List<journalEntry>();
class _journalPageState extends State<journalPage>
{


  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      home : Scaffold
      (
        appBar: AppBar
        (
          title: Text('Journal'),
          backgroundColor: Colors.black54,
        ),
        body: ListView.builder
        (
          itemBuilder: (BuildContext ctxt, int journalPosition,)
          {
              return Dismissible
              (
                key: Key(journals[journalPosition].getTitle()),
                background: Container
                (
                  color: Colors.red,
                ),
                onDismissed: (DismissDirection swipedDir)
                {
                  setState(() {
                  journals.remove(journals[journalPosition]);
                });
                },
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text(journals[journalPosition].getDate().substring(8,10), style: TextStyle(color: Colors.white, fontSize: 18.0),),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    title: Text(journals[journalPosition].getTitle(), style: TextStyle(fontFamily: 'Oswald',fontSize: 17.0),),
                    subtitle: Text(journals[journalPosition].getEntry()),
                    ),
                    Divider()
  ],
              ),
            );
          },
          itemCount: journals.length,
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 6.0,
          onPressed: () {

            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return addJournalEntry();
            })).then((_) {

            });
          },
          child: Icon(Icons.edit),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}