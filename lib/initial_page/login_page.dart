import 'package:flutterapp/main_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapp/functions.dart';
import 'package:flutterapp/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginEntryState createState() => _LoginEntryState();
}

class _LoginEntryState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    String userMail;
    String password;

    return Scaffold(
        appBar: AppBar(title: Text("Login Menu")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              Text("please enter your e-mail"),
              TextField(
                onChanged: (loginName){
                  userMail = loginName;
                },
              ),
              SizedBox(height: 20,),
              Text("please enter your password"),
              TextField(
                obscureText: true,
                onChanged: (pass){
                  password = pass;
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                width: double.infinity,
                child: FlatButton(

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  color: Colors.lightBlue,
                  child: Text('LOGIN', style: TextStyle(fontSize: 20.0),),

                  //以下画面遷移
                  onPressed: () async{
                    FirebaseAuth _auth = FirebaseAuth.instance;
                    await _auth.signInWithEmailAndPassword(
                        email: userMail, password: password
                    );
                    navigatePage(context, MainPage());
                  },
                ),
              )
            ],
          ),
        )
    );
  }
}
