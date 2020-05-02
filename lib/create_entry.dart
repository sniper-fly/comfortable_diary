import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'diary.dart';

class CreateEntry extends StatefulWidget {
  @override
  _CreateEntryState createState() => _CreateEntryState();
}

class _CreateEntryState extends State<CreateEntry> {
  String titleText = '';
  String articleText = '';
  String strDate = DateFormat('yyyy-MM-dd - kk:mm').format(DateTime.now());

  void  createDiary(String strTitle, String strArticle) {
    Firestore.instance.collection("diaries").add({
      "title": strTitle,
      "article" : strArticle,
      "createdAt": DateTime.now()
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("title"),),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(strDate),
              Text("please enter new entry TITLE"),
              TextField(
                onChanged: (entryTitle){
                  titleText = entryTitle;
                },
              ),
              Text("please enter new article"),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: (article){
                  articleText = article;
//                setState(() {
//                });
                },
              ),
              FlatButton(
                child: Icon(Icons.add_circle),
                onPressed: (){
                  print("before");
                  createDiary(titleText, articleText);
                  print("after");
                },
              )
            ],
          ),
        ));
  }
}
