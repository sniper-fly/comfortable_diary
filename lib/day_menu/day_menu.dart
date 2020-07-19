import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comfortable_diary/class/property.dart';
import 'package:comfortable_diary/day_menu/day_property_choose_dialog.dart';
import 'package:comfortable_diary/day_menu/properties/image_property.dart';
import 'package:comfortable_diary/day_menu/properties/text_property.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

class DayMenu extends StatefulWidget {
  @override
  _DayMenuState createState() => _DayMenuState();
}

class _DayMenuState extends State<DayMenu> {
  String plan;
  String strToday = DateFormat('yyyy  MM/dd').format(DateTime.now());
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return DayMenuBody(strToday: strToday);
  }
}

class DayMenuBody extends StatefulWidget {
  const DayMenuBody({
    Key key,
    @required this.strToday,
  }) : super(key: key);

  final String strToday;

  @override
  _DayMenuBodyState createState() => _DayMenuBodyState();
}

class _DayMenuBodyState extends State<DayMenuBody> {
  DateTime currentDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    DateTime currentDateTomorrow = currentDate.add(Duration(days: 1));
    String strCurrentDate = DateFormat('yyyy  MM/dd').format(currentDate);

    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged.flatMap((user) =>
            Firestore
                .instance
                .collection("users")
                .document(user.uid)
                .collection("property")
                .where("createdAt",
                    isGreaterThanOrEqualTo: currentDate,
                    isLessThan: currentDateTomorrow)
                .snapshots()),
        builder: (context, snapshot) {
          //main pageの中の一部なので外でもscaffold
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final rowProperties = snapshot.data.documents;

//          diariesに,Diary classに合う形で加工して代入
          final properties = rowProperties
              .map((item) => Property(
                    item["type"],
                    item["createdAt"].toDate(),
                    title: item["title"],
                    body: item["article"],
                    imageUrl: item["imageUrl"],
                    imageDirAddress: item["imageDirAddress"],
                    documentId: item.documentID,
                  ))
              .cast<Property>()
              .toList();

          return Scaffold(
            backgroundColor: Colors.grey[200],
            body: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          IconButton(
                            iconSize: 50.0,
                            icon: Icon(Icons.chevron_left),
                            onPressed: () {
                              setState(
                                () {
                                  currentDate =
                                      currentDate.add(Duration(days: -1));
                                },
                              );
                            },
                          ),
                          OutlineButton(
                            child: Text(
                              strCurrentDate,
                              style: TextStyle(
                                fontSize: 24.0,
                              ),
                            ),
                            onPressed: () async {
                              DateTime date = await showDatePicker(
                                  context: context,
                                  initialDate: currentDate,
                                  firstDate: DateTime(2010),
                                  lastDate: DateTime(2050));
                              if (date != null) {
                                setState(() {
                                  currentDate = date;
                                });
                              }
                            },
                          ),
                          IconButton(
                            iconSize: 50.0,
                            icon: Icon(Icons.chevron_right, size: 50.0),
                            onPressed: () {
                              setState(
                                () {
                                  currentDate =
                                      currentDate.add(Duration(days: 1));
                                },
                              );
                            },
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ],
                  ),
                ),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      if (properties[index].type == "text") {
                        return TextProperty(properties[index]);
                      } else {
                        //image
                        return ImageProperty(
                          properties[index].imageUrl,
                          properties[index].documentId,
                          properties[index].imageDirAddress,
                        );
                      }
                    },
                    childCount: properties.length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DayPropertyChooseDialog(currentDate);
                  },
                );
              },
            ),
          );
        });
  }
}
