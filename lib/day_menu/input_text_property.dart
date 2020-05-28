import 'package:flutter/material.dart';

class InputTextProperty extends StatefulWidget {
  @override
  _InputTextPropertyState createState() => _InputTextPropertyState();
}

class _InputTextPropertyState extends State<InputTextProperty> {
  String articleText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("article")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'enter your title'
                  ),
              ),
              SizedBox(height: 20.0,),
              TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'enter your article'
                  ),
                  onChanged: (article) {
                    articleText = article;
                  }
              ),
              FlatButton(
                child: Icon(Icons.add_circle),
                onPressed: () {

                },
              )
            ],
          ),
        ));
  }
}
