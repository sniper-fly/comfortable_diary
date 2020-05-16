import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/diary_detail/diary_detail.dart';
import 'package:flutterapp/functions.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import '../diary.dart';

class DiaryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged.flatMap((user) => Firestore
          .instance
          .collection("users")
          .document(user.uid)
          .collection("diaries")
          .snapshots()),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return (Text('Loading data..'));
        }

//          rowDiariesは以下のキーを持つ辞書のリスト
//          "article":<string>
//          "createdAt":<timestamp>
//          "title":<string>
        final rowDiaries = snapshot.data.documents;

//          diariesに,Diary classに合う形で加工して代入
        final diaries = rowDiaries
            .map((item) => Diary(
            DateFormat('yyyy-MM-dd - kk:mm')
                .format(item["createdAt"].toDate()),
            item["title"],
            item["article"]))
            .toList();

        return Center(
          child: ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (_, index) => ListTile(
              title: Text(diaries[index].title),
              subtitle: Text(diaries[index].createdAt),
              onTap: () {
                navigatePage(context, DiaryDetail(diaries[index]));
              },
            ),
          ),
        );
      },
    );
  }
}
