import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/create_entry.dart';
import 'package:flutterapp/functions.dart';
import 'package:flutterapp/initial_page.dart';
import 'package:intl/intl.dart';
import 'diary.dart';
import 'diary_detail.dart';
import 'register_page.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutterapp/diary_list.dart';

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

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<dynamic> rowDiaries = [];
  List<Diary> diaries = [];

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("comfortable diary"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Text("diary")),
              Tab(
                icon: Text("review"),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            showDiaries(rowDiaries, diaries),
            Center(
              child: Text("hoge"),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            //日記を追加する
            navigatePage(context, CreateEntry());
          },
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
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

