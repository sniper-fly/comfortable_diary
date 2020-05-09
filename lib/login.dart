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
      appBar: AppBar(title: Text("Login Menu")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              Text("please enter your login ID"),
              TextField(
                onChanged: (loginName){
                  LoginID = loginName;
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
                  onPressed: (){
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