import 'package:comfortable_diary/day_menu/input_image_property.dart';
import 'package:comfortable_diary/day_menu/input_text_property.dart';
import 'package:flutter/material.dart';
import 'package:comfortable_diary/functions.dart';

class DayPropertyChooseDialog extends StatelessWidget {
  final Function(Color) addDayProperty;
  DayPropertyChooseDialog(this.addDayProperty);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("title"),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            addDayProperty(Colors.red);
            Navigator.pop(context);
            navigatePage(context, InputTextProperty());
          },
          child: Text("red article"),
        ),
        SimpleDialogOption(
          onPressed: () {
            addDayProperty(Colors.blue);
            Navigator.pop(context);
            navigatePage(context, InputImageProperty());
          },
          child: Text("blue image"),
        ),
      ],
    );
  }
}
