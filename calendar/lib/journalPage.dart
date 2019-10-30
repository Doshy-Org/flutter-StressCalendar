import 'package:flutter/material.dart';
import 'package:calendar/addJournalEntry.dart';

class journalPage extends StatefulWidget{
  _journalPageState createState() => _journalPageState();

}
List<Map<String, String>> journals = [
    {'head': 'Bounced Date', 'date': '14-Feb-019'},
    {'head': 'Flutter Study jam', 'date': '17-March-019'},
    {'head': 'Movie previews', 'date': '21-May-018'},
    {'head': 'Amazing assessment results', 'date': '16-Feb-019'},
    {'head': 'Travel and adventure', 'date': '30-Dec-018'},
    {'head': 'Meeting new catch', 'date': '01-Aug-017'},
    {'head': 'Crazy shoping', 'date': '14-Feb-016'}
  ];
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
          backgroundColor: Colors.pinkAccent,
        ),
        body: ListView.builder
        (
          itemBuilder: (BuildContext ctxt, int journalPosition,)
          {
              return Dismissible
              (
                key: Key(journals[journalPosition]['head']),
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
                      child: Text(journals[journalPosition]['head'][0], style: TextStyle(color: Colors.deepOrange, fontSize: 18.0),),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    title: Text(journals[journalPosition]['head'], style: TextStyle(fontFamily: 'Oswald',fontSize: 17.0),),
                    subtitle: Text(journals[journalPosition]['date']),
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