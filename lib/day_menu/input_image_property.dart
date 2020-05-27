import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputImageProperty extends StatefulWidget {
  @override
  _InputImagePropertyState createState() => _InputImagePropertyState();
}

class _InputImagePropertyState extends State<InputImageProperty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("image")),
      body: Text("please upload your image file"),
    );
  }
}
