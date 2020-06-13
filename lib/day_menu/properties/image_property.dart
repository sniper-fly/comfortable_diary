import 'package:flutter/material.dart';

class ImageProperty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.blue[300],
      child: Text("this is image property"),
    );
  }
}
