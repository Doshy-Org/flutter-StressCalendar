import 'package:flutter/material.dart';
import 'package:calendar/addJournalEntry.dart';

class journalPage extends StatefulWidget{
  _journalPageState createState() => _journalPageState();

}

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
                key: Key('strOnK'),
                background: Container
                (
                  color: Colors.red,
                ),
                onDismissed: (DismissDirection swipedDir)
                {
                },
              );
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
           );
          },
        ),
      ),
    );
  }
}

 BoxDecoration customcard(){
  return BoxDecoration(
    border: Border.all(
      color: Color.fromRGBO(234, 234, 234,1), //gray
      width: 2,
    ),
  
    borderRadius: new BorderRadius.all(const Radius.circular(20.0)),
  );
}