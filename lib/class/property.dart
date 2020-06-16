class Property {
  final String type;
  final DateTime createdAt;
  final String title;
  final String body;
  final String imageLink;
  final String documentId;

  Property(this.type, this.createdAt,
      {this.title, this.body, this.imageLink, this.documentId});
}
