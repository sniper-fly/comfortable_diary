import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'create_entry.dart';
import 'diary.dart';
import 'diary_list.dart';

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
}