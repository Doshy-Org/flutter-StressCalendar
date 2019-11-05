import 'package:flutter/material.dart';

class journalEntry
{
  String title = "";
  String entry = "";
  String date = "";

  journalEntry(String tit, String ent, String dat)
  {
    title=tit;
    entry=ent;
    date=dat;
  }
  
  void editTitle(String n)
  {
    title += n;
  }
  
  void editEntry(String newEntry)
  {
    entry += newEntry;
  }
  void editDate(String d)
  {
    date = d;
  }
  String getTitle()
  {
    return title;
  }

  String getEntry()
  {
    return entry;
  }

  String getDate()
  {
    return date;
  }

}