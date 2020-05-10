import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/create_entry.dart';
import 'package:flutterapp/initialPage.dart';
import 'package:intl/intl.dart';
import 'diary.dart';
import 'diary_detail.dart';
import 'registerPage.dart';
import 'package:rxdart/rxdart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InitialPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final String strDate = DateFormat('yyyy-MM-dd - kk:mm').format(DateTime.now());


  List<dynamic> rowDiaries = [];
  List<Diary> diaries = [];

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser();
    return Scaffold(
      appBar: AppBar(
        title: Text("comfortable diary"),
      ),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged.flatMap(
      (user) => Firestore.instance
          .collection("users")
          .document(user.uid)
          .collection("diaries")
          .snapshots()),

      builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return (Text('Loading data..'));
          }

//          rowDiariesは以下のキーを持つ辞書のリスト
//          "article":<string>
//          "createdAt":<string>
//          "title":<string>
          rowDiaries = snapshot.data.documents;

//          diariesに,Diary classに合う形で加工して代入
          diaries = rowDiaries.map((item) =>
              Diary(
                  DateFormat('yyyy-MM-dd - kk:mm').format(item["createdAt"].toDate()),
                  item["title"],
                  item["article"]
              )
          ).toList();

          return Center(
            child: ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (_, index) => ListTile(
                title: Text(diaries[index].title),
                subtitle: Text(diaries[index].createdAt),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return DiaryDetail(diaries[index]);
                      },
                    ),
                  );
                },

              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //画面遷移の一連コマンド、return の値を遷移したいページにしていすればおｋ
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return CreateEntry();
              },
            ),
          );
          //画面遷移ここまで
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
