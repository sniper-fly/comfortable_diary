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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
  static final String strDate = DateFormat('yyyy-MM-dd - kk:mm').format(DateTime.now());
  static String content = """hello world apple banana cake desert egg folk gorilla
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
      body: Center(
        child: ListView.builder(
            itemCount: diaries.length,
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
                  }
                )),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //画面遷移の一連コマンド、return の値を遷移したいページにしていすればおｋ
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return CreateEntry();
                //画面遷移ここまで
              },
            ),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
