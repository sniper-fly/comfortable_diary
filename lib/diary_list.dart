import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

import 'diary.dart';
import 'diary_detail.dart';

Widget showDiaries(List<dynamic> rowDiaries, List<Diary> diaries) {
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
      rowDiaries = snapshot.data.documents;

//          diariesに,Diary classに合う形で加工して代入
      diaries = rowDiaries
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return DiaryDetail(diaries[index]);
                  },
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
