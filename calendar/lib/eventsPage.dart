import 'package:flutter/material.dart';

class eventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt)
  {//signals that enemies are missing
    return new Scaffold(
      body:(
        Center(
          child: ListView(
            children: <Widget>[
              Container(
            width: double.infinity,
            child: IconButton(
              icon:Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(ctxt).pop();
                }
                ),
              ),
            ],
          ),
          
        
        )
      
      ),
    );

  }
}