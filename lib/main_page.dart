import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/functions.dart';
import 'create_entry.dart';
import 'diary.dart';
import 'diary_list/diary_list.dart';

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
            DiaryList(),
            Center(
              child: Text("hoge"),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            navigatePage(context, CreateEntry());
          },
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}