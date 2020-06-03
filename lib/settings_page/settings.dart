import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 30.0,
        ),
        Text("logout botton"),
        FlatButton(
          child: Icon(Icons.eject),
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
        )
      ],
    );
  }
}
