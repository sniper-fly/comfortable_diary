import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comfortable_diary/day_menu/property_type.dart';
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

Future<String> createTextProperty(String strTitle, String strArticle) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = await _auth.currentUser();
  final ref = await Firestore.instance
      .collection("users")
      .document(user.uid)
      .collection("property")
      .add({
    "type": "text",
    "title": strTitle,
    "article": strArticle,
    "createdAt": DateTime.now(),
  });
  return ref.documentID;
}

Future<String> createImageProperty(String imgUrl) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = await _auth.currentUser();
  final ref = await Firestore.instance
      .collection("users")
      .document(user.uid)
      .collection("property")
      .add({
    "type": "image",
    "createdAt": DateTime.now(),
    "imageLink" : imgUrl,
  });
  return ref.documentID;
}

void deleteProperty(String docId) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = await _auth.currentUser();
  Firestore.instance
      .collection("users")
      .document(user.uid)
      .collection("property")
      .document(docId)
      .delete();
}
