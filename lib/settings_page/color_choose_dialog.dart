import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorChooseDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("please choose your favorite color"),
      children: <Widget>[
        SimpleDialogOption(
          child: Text("blue"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
