import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'diary.dart';

class DiaryDetail extends StatelessWidget {
  final Diary diary;
  DiaryDetail(this.diary);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(diary.title)),
      body: Column(
        children: <Widget>[
          Text(diary.name),
          Text(diary.content),
        ],
      )
    );
  }
}
