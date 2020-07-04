import 'package:comfortable_diary/functions.dart';
import 'package:flutter/material.dart';

class InputTextProperty extends StatefulWidget {
  @override
  _InputTextPropertyState createState() => _InputTextPropertyState();
}

class _InputTextPropertyState extends State<InputTextProperty> {
  String articleText = '';
  String articleTitle = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("article")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextField(
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                  decoration: InputDecoration(

                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'title'),
                  onChanged: (title) {
                    articleTitle = title;
                  }),
//              SizedBox(
//                height: 20.0,
//              ),
              Divider(height: 10.0, thickness: 2.0,),
              TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'enter your article'),
                  onChanged: (article) {
                    articleText = article;
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          try {
            createTextProperty(articleTitle, articleText);
            Navigator.pop(context);
          } catch (error) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("error!")));
          }
        },
      ),
    );
  }
}
