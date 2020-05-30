import 'package:comfortable_diary/day_menu/property_detail.dart';
import 'package:comfortable_diary/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextProperty extends StatelessWidget {
  final String title = "happy day";
  final String body = "I was happy";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatePage(context, TextPropertyDetail(title, body));
      },
      child: Container(
        margin: EdgeInsets.all(16.0),
        color: Colors.red[300],
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontSize: 30.0),
        )),
      ),
    );
  }
}
