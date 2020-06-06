import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:comfortable_diary/diary_detail/diary_detail.dart';
import 'package:comfortable_diary/functions.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import './create_entry.dart';
import '../class/diary.dart';

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

        return Scaffold(
          body: Center(
            child: ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (_, index) => ListTile(
                title: Text(diaries[index].title),
                subtitle: Text(diaries[index].createdAt),
                onTap: () {
                  navigatePagePush(context, DiaryDetail(diaries[index]));
                },
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
//              FirebaseAuth.instance.signOut();
              navigatePagePush(context, CreateEntry());
            },
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
