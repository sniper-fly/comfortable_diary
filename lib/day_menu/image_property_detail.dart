import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagePropertyDetail extends StatelessWidget {
  final String imageLink;
  ImagePropertyDetail(this.imageLink);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(imageLink),
            ),
          ],
        ));
  }
}
