import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginEntryState createState() => _LoginEntryState();
}

class _LoginEntryState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    String LoginID;
    String password;

    return Scaffold(
      appBar: AppBar(title: Text("Login")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text("please enter your login ID"),
              TextField(
                onChanged: (loginName){
                  LoginID = loginName;
                },
              ),
              Text("please enter your password"),
              TextField(
                onChanged: (pass){
                  password = pass;
                },
              ),
              FlatButton(
                child: Icon(Icons.chevron_right),
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return (MyHomePage());
                      },
                    ),
                  );
                },
              )
            ],
          ),
        )
    );
  }
}