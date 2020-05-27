import 'package:flutter/material.dart';

class InputTextProperty extends StatefulWidget {
  @override
  _InputTextPropertyState createState() => _InputTextPropertyState();
}

class _InputTextPropertyState extends State<InputTextProperty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("article")),
      body: Text("please enter article"),
    );
  }
}
