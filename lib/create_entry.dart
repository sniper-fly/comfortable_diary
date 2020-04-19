import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateEntry extends StatefulWidget {
  @override
  _CreateEntryState createState() => _CreateEntryState();
}

class _CreateEntryState extends State<CreateEntry> {
  String textFieldValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("title"),),
        body: Column(
          children: <Widget>[
            Text("create new entry"),
            TextField(
              onChanged: (text){
                textFieldValue = text;
                //print(text);
              },
            ),
            FlatButton(
              child: Icon(Icons.add_circle),
              onPressed: (){
                print(textFieldValue);
              },
            )
          ],
        ));
  }
}
