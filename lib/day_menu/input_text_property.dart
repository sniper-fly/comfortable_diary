import 'package:comfortable_diary/functions.dart';
import 'package:flutter/material.dart';

class InputTextProperty extends StatefulWidget {

  @override
  _InputTextPropertyState createState() => _InputTextPropertyState();
}

class _InputTextPropertyState extends State<InputTextProperty> {
  String articleText = '';
  String articleTitle = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("article")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'enter your title'),
                  onChanged: (title) {
                    articleTitle = title;
                  }),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'enter your article'),
                  onChanged: (article) {
                    articleText = article;
                  }),
              FlatButton(
                child: Icon(Icons.add_circle),
                onPressed: () {
                  try {
                    createTextProperty(articleTitle, articleText);
                    Navigator.pop(context);
                  }
                  catch (error) {
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text("error!")));
                  }
//                  widget.addDayProperty(Property(propertyType.text,
//                      title: articleTitle, body: articleText));
//                  createDiary("articles", articleTitle, articleText);
                },
              )
            ],
          ),
        ));
  }
}
