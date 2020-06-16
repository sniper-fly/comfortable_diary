import 'package:comfortable_diary/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextPropertyDetail extends StatelessWidget {
  final String title;
  final String body;
  final String documentId;
  TextPropertyDetail(this.title, this.body, this.documentId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () {
                deleteProperty(documentId);
                Navigator.pop(context);
              },
            )
          ],
        ),
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
