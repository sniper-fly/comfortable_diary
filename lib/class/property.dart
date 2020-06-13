import 'package:comfortable_diary/day_menu/property_type.dart';

class Property {
  final propertyType type;
  final DateTime createdAt;
  final String title;
  final String body;
  final String imageLink;

  Property(this.type, this.createdAt, {this.title, this.body, this.imageLink});
}