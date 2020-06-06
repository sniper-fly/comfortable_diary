import 'package:comfortable_diary/class/property.dart';
import 'package:comfortable_diary/day_menu/property_detail.dart';
import 'package:comfortable_diary/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextProperty extends StatelessWidget {
  final Property property;
  TextProperty(this.property);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatePagePush(
            context, TextPropertyDetail(property.title, property.body));
      },
      child: Container(
        margin: EdgeInsets.all(16.0),
        color: Colors.red[300],
        child: Center(
          child: Text(
            property.title,
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}
