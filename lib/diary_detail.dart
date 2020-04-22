import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'diary.dart';

class DiaryDetail extends StatelessWidget {
  final Diary diary;
  DiaryDetail(this.diary);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text(diary.title))
      ),
      body: Column(
        children: <Widget>[
          Container(
              width: 100.0,
              height: 100.0,
              child: Column(
                children: <Widget>[
                  Text(diary.name),
                  Text("hogehoge")
                ],
              )
          ),
          Text(diary.content),
        ],
      )

//      Container(
//        width: 300.0,
//        height: 400.0,
//        padding: EdgeInsets.all(30),
//        child: Column(
//          children: <Widget>[
//            Text(diary.name),
//            Text(diary.content),
//          ],
//        ),
//      )

    );
  }
}
