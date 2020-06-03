import 'package:comfortable_diary/class/property.dart';
import 'package:comfortable_diary/day_menu/day_menu.dart';
import 'package:comfortable_diary/day_menu/property_file.dart';
import 'package:comfortable_diary/functions.dart';
import 'package:comfortable_diary/main_page.dart';
import 'package:flutter/material.dart';

class InputTextProperty extends StatefulWidget {
  final Function(Property) addDayProperty;
  InputTextProperty(this.addDayProperty);

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
                  widget.addDayProperty(Property(propertyType.text,
                      title: articleTitle, body: articleText));
//                  createDiary("articles", articleTitle, articleText);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }
}
