import 'dart:ui';

import 'package:comfortable_diary/day_property_choose_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayMenu extends StatefulWidget {
  @override
  _DayMenuState createState() => _DayMenuState();
}

class _DayMenuState extends State<DayMenu> {
  String plan;
  String strToday = DateFormat('yyyy  MM/dd').format(DateTime.now());
  int itemCount = 0;
  List<Color> colorList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Text(strToday),
                Text("title"),
              ],
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: colorList[index],
                  margin: EdgeInsets.all(16),
                );
              },
              childCount: colorList.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return (DayPropertyChooseDialog(
                  (color) {
                    setState(
                      () {
                        colorList.add(color);
                      },
                    );
                  },
                ));
              });
        },
      ),
    );
  }
}
