import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigatePage(BuildContext context, Widget page) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return page;
      },
    ),
  );
}
