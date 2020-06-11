import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class InputImageProperty extends StatefulWidget {
  @override
  _InputImagePropertyState createState() => _InputImagePropertyState();
}

class _InputImagePropertyState extends State<InputImageProperty> {
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.file(_image),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  FlatButton(
                    child: Icon(Icons.add_circle),
                    onPressed: () {},
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

//    return Scaffold(
//      appBar: AppBar(title: Text("image")),
//      body: Text("please upload your image file"),
//    );
  Future<void> getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
}
