import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'functions.dart';
import 'main_page.dart';

class CreateEntry extends StatefulWidget {
  @override
  _CreateEntryState createState() => _CreateEntryState();
}

class _CreateEntryState extends State<CreateEntry> {
  String titleText = '';
  String articleText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("title"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text("please enter new entry TITLE"),
              TextField(
                onChanged: (entryTitle) {
                  titleText = entryTitle;
                },
              ),
              Text("please enter new article"),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: (article) {
                  articleText = article;
//                setState(() {
//                });
                },
              ),
              FlatButton(
                child: Icon(Icons.add_circle),
                onPressed: () {
                  createDiary("diaries", titleText, articleText);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return (MainPage());
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
