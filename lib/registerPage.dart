import 'package:cloud_firestore/cloud_firestore.dart';

import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterEntryState createState() => _RegisterEntryState();
}

class _RegisterEntryState extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {
    String userMail;
    String password;

    return Scaffold(
      appBar: AppBar(title: Text("Register Menu")),
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
                    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
                      email: userMail,
                      password: password,
                    )).user;
                    await Firestore.instance.collection("users")
                        .document(user.uid).setData({"email":user.email});
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return (MyHomePage());
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        )
    );
  }
}