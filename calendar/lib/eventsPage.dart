import 'package:flutter/material.dart';

class eventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt)
  {//signals that enemies are missing
    
    return Scaffold(
      body: ListView(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20.0),
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               //back button
              IconButton(
                icon:Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(ctxt).pop();
                },
              ), 
              SizedBox(width:70, height: 100),
             // AppBar(title: Text("Your Tasks"), backgroundColor: Colors.pink[200],),
              Text("Your Tasks", textAlign: TextAlign.right,style:TextStyle(fontSize:25)),
            ],
          ),
          
        ),
        //xd just have center button //not for top?      uh are u doing same 
        
        ],
      ),
    );


  }
}