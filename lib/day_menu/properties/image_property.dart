import 'package:flutter/material.dart';

import '../../functions.dart';
import '../image_property_detail.dart';

class ImageProperty extends StatelessWidget {
  final String imageLink;

  ImageProperty(this.imageLink);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatePagePush(context, ImagePropertyDetail(imageLink));
      },
      child: Container(
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
        child: Image.network(imageLink),
      ),
    );
  }
}
