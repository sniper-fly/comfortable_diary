import 'package:comfortable_diary/authentication_page/authentication_page.dart';
import 'package:comfortable_diary/functions.dart';
import 'package:comfortable_diary/settings_page/color_choose_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          FlatButton(
            child: Text("Theme Color"),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ColorChooseDialog();
                },
              );
            },
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            children: <Widget>[
              Text("login email address    "),
              FutureBuilder(
                future: getUserEmailAddress(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return snapshot.hasData ? Text(snapshot.data) : SizedBox(height: 30.0);
                },
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Text("logout botton"),
          FlatButton(
            child: Icon(Icons.eject),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuthenticationPage(),
                  ),
                  (_) => false);
            },
          )
        ],
      ),
    );
  }
}
