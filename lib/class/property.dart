class Property {
  final String type;
  final DateTime createdAt;
  final String title;
  final String body;
  final String imageUrl;
  final String imageDirAddress;
  final String documentId;

  Property(this.type, this.createdAt,
      {this.title, this.body,
        this.imageUrl, this.imageDirAddress, this.documentId});
}
