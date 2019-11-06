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
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: new Text("Journal", style: TextStyle(color: Colors.black),),
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
                  // ListTile(
                  //   contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                  //   leading: CircleAvatar(
                  //     child: Text(journals[journalPosition].getDate().substring(8,10), style: TextStyle(color: Colors.white, fontSize: 18.0),),
                  //     backgroundColor: Theme.of(context).primaryColor,
                  //   ),
                  //   title: Text(journals[journalPosition].getTitle(), style: TextStyle(fontFamily: 'Oswald',fontSize: 17.0),),
                  //   subtitle: Text(journals[journalPosition].getEntry()),
                  //   ),
                   SizedBox(      
                      height: 100.0,
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Container(
                              decoration: new BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey[300])),
                                color: Colors.blue,
                              ),
                              //color: Colors.blue,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: new Text(journals[journalPosition].getDate().substring(8,10), style: TextStyle(color: Colors.white, fontSize: 18.0)),
                          ),
                          new Expanded(
                            child: new Container(
                              decoration: new BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey[300]))
                              ),
                              child:  new ListTile(
                              title: Text(journals[journalPosition].getTitle(), style: TextStyle(fontFamily: 'Oswald',fontSize: 17.0),),
                              subtitle: Text(journals[journalPosition].getEntry()),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  
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