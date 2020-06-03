import 'package:comfortable_diary/class/property.dart';
import 'package:comfortable_diary/day_menu/input_image_property.dart';
import 'package:comfortable_diary/day_menu/input_text_property.dart';
import 'package:comfortable_diary/day_menu/property_type.dart';
import 'package:flutter/material.dart';
import 'package:comfortable_diary/functions.dart';

class DayPropertyChooseDialog extends StatelessWidget {
  final Function(Property) addDayProperty;
  DayPropertyChooseDialog(this.addDayProperty);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("title"),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
//            addDayProperty(propertyType.text);
            Navigator.pop(context);
            navigatePage(context, InputTextProperty(addDayProperty));
          },
          child: Text("article"),
        ),
        SimpleDialogOption(
          onPressed: () {
//            addDayProperty(propertyType.image);
            Navigator.pop(context);
//            navigatePage(context, InputImageProperty());
          },
          child: Text("image"),
        ),
      ],
    );
  }
}
