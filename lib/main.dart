import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/create_entry.dart';
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            //画面遷移の一連コマンド、return の値を遷移したいページにしていすればおｋ
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return CreateEntry();
                },
              ),
            );
            //画面遷移ここまで
          },
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
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
}

