import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/create_entry.dart';
import 'package:flutterapp/functions.dart';
import 'package:intl/intl.dart';
import 'diary.dart';
import 'initial_page/initial_page.dart';
import 'package:rxdart/rxdart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InitialPage(),
    );
  }
}

  //画面遷移を関数化したい
//  void navigatePage(Widget page) {
//    Navigator.of(context).push(
//      MaterialPageRoute(
//        builder: (context) {
//          return page;
//        },
//      ),
//    );
//  }
//}

