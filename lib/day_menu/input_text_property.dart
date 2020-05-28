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
        body: Column(
          children: <Widget>[
            SizedBox(height: 20.0,),
            TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
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
        ));
  }
}
