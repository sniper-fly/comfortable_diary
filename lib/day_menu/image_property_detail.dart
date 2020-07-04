import 'package:comfortable_diary/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagePropertyDetail extends StatelessWidget {
  final String imageLink;
  final String documentId;
  final String imageDirAddress;
  ImagePropertyDetail(this.imageLink, this.documentId, this.imageDirAddress);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () {
                deleteProperty(documentId);
                deleteStorageFile(imageDirAddress);
                Navigator.pop(context);
              },
            )
          ],
        ),
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
