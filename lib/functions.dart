import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigatePagePush(BuildContext context, Widget page) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return page;
      },
    ),
  );
}

void createDiary(String strTitle, String strArticle) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = await _auth.currentUser();
  Firestore.instance
      .collection("users")
      .document(user.uid)
      .collection("property")
      .add({
    "title": strTitle,
    "article": strArticle,
    "createdAt": DateTime.now(),
  });
}
