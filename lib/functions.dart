import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

void createTextProperty(String strTitle, String strArticle, DateTime selectedDate) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = await _auth.currentUser();
  Firestore.instance
      .collection("users")
      .document(user.uid)
      .collection("property")
      .add({
    "type": "text",
    "title": strTitle,
    "article": strArticle,
    "createdAt": selectedDate,
  });
}

void createImageProperty(String imgUrl, String imgDirAddress) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = await _auth.currentUser();
  Firestore.instance
      .collection("users")
      .document(user.uid)
      .collection("property")
      .add({
    "type": "image",
    "createdAt": DateTime.now(),
    "imageUrl" : imgUrl,
    "imageDirAddress" : imgDirAddress,
  });
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

void deleteStorageFile(String fileAddress) {
  FirebaseStorage.instance
      .ref()
      .child(fileAddress)
      .delete();
}

Future<String> getUserEmailAddress() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = await _auth.currentUser();
  final document = await Firestore.instance
  .collection("users")
  .document(user.uid)
  .get();

  return document.data["email"];
}