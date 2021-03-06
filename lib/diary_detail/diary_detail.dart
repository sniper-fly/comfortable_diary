import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../class/diary.dart';

class DiaryDetail extends StatelessWidget {
  final Diary diary;
  DiaryDetail(this.diary);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text(diary.title))),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              diary.createdAt,
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(diary.article),
            ),
          ],
        ));
  }
}
