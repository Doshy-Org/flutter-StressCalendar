import 'package:flutter/material.dart';
import 'package:calendar/addJournalEntry.dart';

class journalPage extends StatefulWidget{
  _journalPageState createState() => _journalPageState();

}
List<Map<String, String>> journals = new List<Map<String,String>>();
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
                key: Key(journals[journalPosition]['journal_title']),
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
                      child: Text(journals[journalPosition]['journal_title'][0], style: TextStyle(color: Colors.black38, fontSize: 18.0),),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    title: Text(journals[journalPosition]['journal_title'], style: TextStyle(fontFamily: 'Oswald',fontSize: 17.0),),
                    subtitle: Text(journals[journalPosition]['journal_entry']),
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