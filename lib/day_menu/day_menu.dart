import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comfortable_diary/class/property.dart';
import 'package:comfortable_diary/day_menu/day_property_choose_dialog.dart';
import 'package:comfortable_diary/day_menu/properties/image_property.dart';
import 'package:comfortable_diary/day_menu/properties/text_property.dart';
import 'package:comfortable_diary/day_menu/property_type.dart';
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
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged.flatMap((user) =>
            Firestore.instance
                .collection("users")
                .document(user.uid)
                .collection("property")
                .snapshots()),
        builder: (context, snapshot) {
          //main pageの中の一部なので外でもscaffold
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          final rowProperties = snapshot.data.documents;

//          diariesに,Diary classに合う形で加工して代入
          final properties = rowProperties
              .map((item) => Property(
                    propertyType.text,
                    item["createdAt"].toDate(),
                    title: item["title"],
                    body: item["article"],
                  ))
              .toList();

          return Scaffold(
            backgroundColor: Colors.grey[200],
            body: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Text(strToday),
                      Text("title"),
                    ],
                  ),
                ),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      if (properties[index].type == propertyType.text) {
                        return TextProperty(properties[index]);
                      } else {
                        //image
                        return ImageProperty();
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
                    return DayPropertyChooseDialog();
//                      //関数Aに関数Bを渡し、関数Aの中で関数Bを実行してもらう 以下が関数A
//                      (property) {
////                        setState(
////                          //setStateでやってほしい動作を書く
////                          () {
////                            properties.add(property);
////                          },
////                        );
//                      },
//                    );
                  },
                );
              },
            ),
          );
        });
  }
}
