import 'package:flutter/material.dart';

class DayPropertyChooseDialog extends StatelessWidget {
  final Function(Color) addDayProperty;
  DayPropertyChooseDialog(this.addDayProperty);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(title: Text("title"), children: <Widget>[
      SimpleDialogOption(
        onPressed: () {
          addDayProperty(Colors.red);
          Navigator.pop(context);
        },
        child: Text("red article"),
      ),
      SimpleDialogOption(
        onPressed: () {
          addDayProperty(Colors.blue);
          Navigator.pop(context);
        },
        child: Text("blue image"),
      ),
      SimpleDialogOption(
        onPressed: () {
          addDayProperty(Colors.green);
          Navigator.pop(context);
        },
        child: Text("green"),
      ),
    ]);
  }
}
