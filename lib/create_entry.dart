import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CreateEntry extends StatefulWidget {
  @override
  _CreateEntryState createState() => _CreateEntryState();
}

class _CreateEntryState extends State<CreateEntry> {
  String titleText = '';
  String articleText = '';
  String strDate = DateFormat('yyyy-MM-dd - kk:mm').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("title"),),
        body: Column(
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
              },
            ),
            FlatButton(
              child: Icon(Icons.add_circle),
              onPressed: (){
                //なぜかprintされない
                print(articleText);
              },
            )
          ],
        ));
  }
}
