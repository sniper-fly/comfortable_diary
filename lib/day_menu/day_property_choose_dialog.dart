import 'package:comfortable_diary/day_menu/input_text_property.dart';
import 'package:flutter/material.dart';
import 'package:comfortable_diary/functions.dart';
import 'input_image_property.dart';

class DayPropertyChooseDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("title"),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
            navigatePagePush(context, InputTextProperty());
          },
          child: Text("article"),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
            navigatePagePush(context, InputImageProperty());
          },
          child: Text("image"),
        ),
      ],
    );
  }
}
