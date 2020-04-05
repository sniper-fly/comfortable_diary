import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/create_entry.dart';

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
 List<String>
 texts
 =["apple","banana","c","d"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello wolrd!!!!"),
      ),
      body: Center(
        child:
          ListView.builder(
            itemCount: texts.length,
              itemBuilder: (_, index) => ListTile(
            title: Text(texts[index]),
                subtitle: Text("subtitle"),
          )

        ),
//        Column(
//          mainAxisAlignment: MainAxisAlignment.start,
//          crossAxisAlignment: CrossAxisAlignment.end,
//
//          children: <Widget>[
//
//            Container(
//              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 50),
//              margin: EdgeInsets.only(top: 20),
//              color: Colors.cyan,
//              height: 200,
//              width: 300,
//              child: Text(
//                'push a!',style: TextStyle(color: Colors.red),
//              ),
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//            Text(
//              'hoge'
//            )
//          ],
//        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return CreateEntry();
              },
            ),
          );
        },
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
