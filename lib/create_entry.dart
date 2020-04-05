import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("title"),),
        body: Column(
          children: <Widget>[
            Text("create new entry"),
            TextField()
          ],
        ));
  }
}
