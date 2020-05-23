import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DaySchedule extends StatefulWidget {
  @override
  _DayScheduleState createState() => _DayScheduleState();
}

class _DayScheduleState extends State<DaySchedule> {
  String plan;
  String strToday = DateFormat('yyyy  MM/dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 15.0),
        Text(
          strToday,
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("plan", style: TextStyle(fontSize: 20.0)),
            Text("act", style: TextStyle(fontSize: 20.0)),
            Text("tag", style: TextStyle(fontSize: 20.0))
          ],
        ),
        SizedBox(height: 10.0),
        Row(
          children: <Widget>[
            Text("9"),
          ],
        ),
//        TextField(
//          selectionWidthStyle: BoxWidthStyle
//        )
      ],
    );
  }
}
