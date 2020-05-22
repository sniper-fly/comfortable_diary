import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:comfortable_diary/authentication_page/register_page.dart';
import 'package:comfortable_diary/functions.dart';

import 'login_page.dart';

class AuthenticationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("initial page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: RaisedButton(
              child: const Text('registration'),
              onPressed: () => navigatePage(context, RegisterPage())
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
          Container(
            child: RaisedButton(
              child: const Text('SignIn/SignOut'),
              onPressed: () {
                navigatePage(context, LoginPage());
              }
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}