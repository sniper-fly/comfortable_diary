import 'package:comfortable_diary/day_menu/property_type.dart';
import 'package:flutter/cupertino.dart';

class Property {
  final propertyType type;
  final DateTime createdAt;
  final String title;
  final String body;
  final Image image;

  Property(this.type, this.createdAt, {this.title, this.body, this.image});
}