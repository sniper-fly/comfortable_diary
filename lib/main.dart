import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/create_entry.dart';
import 'package:intl/intl.dart';
import 'diary.dart';
import 'diary_detail.dart';

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
      home: MyHomePage(title: 'a'),
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
  static final String strDate =
      DateFormat('yyyy-MM-dd - kk:mm').format(DateTime.now());
  static String content =
      """hello world apple banana cake desert egg folk gorilla
  hoge hage house icon json kaggle lemon monkey nallow option parse question relation\
  station tuition union various wrong xenophobia young zero""";

  List<Diary> diaries = [
    Diary(strDate, "title", content),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("comfortable diary"),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('diaries').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return (Text('Loading data..'));
          }
          return Center(
            child: ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (_, index) => ListTile(
                title: Text(snapshot.data.documents[index]["title"]),

//                  timestampはstringじゃないので一旦停止
//                subtitle: Text(snapshot.data.documents[index]["createdAt"]),

//                diaryclassと連携できないため画面遷移を停止
//                onTap: () {
//                  Navigator.of(context).push(
//                    MaterialPageRoute(
//                      builder: (context) {
//                        return DiaryDetail(diaries[index]);
//                      },
//                    ),
//                  );
//                },

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
