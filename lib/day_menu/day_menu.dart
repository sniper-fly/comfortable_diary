import 'dart:ui';
import 'package:comfortable_diary/class/property.dart';
import 'package:comfortable_diary/day_menu/day_property_choose_dialog.dart';
import 'package:comfortable_diary/day_menu/properties/image_property.dart';
import 'package:comfortable_diary/day_menu/properties/text_property.dart';
import 'package:comfortable_diary/day_menu/property_file.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayMenu extends StatefulWidget {
  @override
  _DayMenuState createState() => _DayMenuState();
}

class _DayMenuState extends State<DayMenu> {
  String plan;
  String strToday = DateFormat('yyyy  MM/dd').format(DateTime.now());
  int itemCount = 0;
  List<Property> propertyList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                if (propertyList[index].type == propertyType.text) {
                  return TextProperty(propertyList[index]);
                } else {
                  //image
                  return ImageProperty();
                }
              },
              childCount: propertyList.length,
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
              return DayPropertyChooseDialog(
                //関数Aに関数Bを渡し、関数Aの中で関数Bを実行してもらう 以下が関数A
                (property) {
                  setState(
                    //setStateでやってほしい動作を書く
                    () {
                      propertyList.add(property);
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
