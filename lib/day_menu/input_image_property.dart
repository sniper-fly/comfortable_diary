import 'dart:io';
import 'package:comfortable_diary/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

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
                  RaisedButton(
                    child: Text('upload image'),
                    onPressed: () async {
                      try {
                        uploadFile();
                        Navigator.pop(context);
                      } catch (error) {
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text("error!")));
                        print("error");
                      }
                    },
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

  Future<void> getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future uploadFile() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final user = await _auth.currentUser();
    final String imgDirAddress = '/users/${user.uid}/property/image/${Path.basename(_image.path)}';
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child(imgDirAddress);
    StorageUploadTask uploadTask = storageReference.putFile(_image);

    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then(
      (fileURL) {
        createImageProperty(fileURL, imgDirAddress);
      },
    );
  }
}
