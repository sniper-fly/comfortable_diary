import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextPropertyDetail extends StatelessWidget {
  final String title;
  final String body;
  TextPropertyDetail(this.title, this.body);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text(title))),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(body),
            ),
          ],
        ));
  }
}
