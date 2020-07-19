import 'package:comfortable_diary/functions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputTextProperty extends StatefulWidget {
  final DateTime currentDate;
  InputTextProperty(this.currentDate);

  @override
  _InputTextPropertyState createState() => _InputTextPropertyState();
}

class _InputTextPropertyState extends State<InputTextProperty> {
  String articleText = '';
  String articleTitle = '';
  DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.currentDate;
  }

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
                height: 10.0,
              ),
              GestureDetector(
                child: Text(
                  DateFormat('yyyy  MM/dd').format(selectedDate),
                  style: TextStyle(fontSize: 24.0),
                ),
                onTap: () async {
                  final DateTime date = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2050));
                  if (date != null) {
                    setState(() {
                      selectedDate = date;
                    });
                  }
                },
              ),
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
              Divider(
                height: 10.0,
                thickness: 2.0,
              ),
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
            createTextProperty(articleTitle, articleText, selectedDate);
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
