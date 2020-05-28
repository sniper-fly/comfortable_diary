import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:comfortable_diary/day_menu/day_menu.dart';
import 'class/diary.dart';
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
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("comfortable diary"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Text("diary")),
              Tab(icon: Text("review")),
              Tab(icon: Text("day")),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DiaryList(),
            Center(
              child: Text("review page"),
            ),
            DayMenu(),
          ],
        ),
      ),
    );
  }
}
