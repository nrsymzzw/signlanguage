import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:msl/log/data/database.dart';
import 'package:msl/log/model/numbers.dart';
import 'package:path/path.dart';
import 'package:msl/log/model/alphabets.dart';


class AddNumbers extends StatefulWidget {
  @override _AddNumbersState createState() => _AddNumbersState();
}

class _AddNumbersState extends State<AddNumbers> {

  String title;
  Number num;
  File _image;

  Future getImage(bool gallery) async {
    // Get image from gallery.
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      print('Image Path $_image');
    });
  }

  Future uploadPic(BuildContext context) async{
    String fileName = basename(_image.path);
    StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child("number/$fileName");
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
    _addPathToDatabase(context);
    setState(() {
      print("Image uploaded");
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Image Uploaded')));
    });
  }

  Future<void> _addPathToDatabase(BuildContext context) async {
    try {
      // Get image URL from firebase
      String fileName = basename(_image.path);
      final ref = FirebaseStorage().ref().child("number/$fileName");
      var imageString = await ref.getDownloadURL();

      String id = Firestore.instance.collection("Number").document().documentID;
      num = Number(id:id, title:title,  url:imageString,);

      await DatabaseService().addNumbers(num);

      // Add location and url to database
      //await Firestore.instance.collection('Number').document().setData({'id':id, 'url':imageString , 'title':title});
    }catch(e){
      print(e.message);
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Numbers',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontFamily: "Jeko Bold",
            fontWeight: FontWeight.w700,
          ),
        ),
        //backgroundColor: Color(0xFFB7E3A1),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          iconSize: 30.0,
          padding: EdgeInsets.only(left: 25),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 10,
        titleSpacing: 75,
        toolbarHeight: 80.0,
      ),
      body: Form (
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Column(
              children: [
                Container(
                  child: (_image!=null)?Image.file(
                    _image,
                    height: 160.0,
                    width: 190.0,
                  ):Image.network(
                    "https://www.shoshinsha-design.com/wp-content/uploads/2020/05/noimage_icon-1.png",
                    height: 160.0,
                    width: 190.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Material(
                  color: Color(0xFFF7B980),
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () {
                      getImage(true);
                    },
                    minWidth: 350.0,
                    height: 50.0,
                    child: Text(
                      "ADD IMAGE",
                      style:
                      TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (value) => value.isEmpty ? 'Title is required.': null,
                  onChanged: (value)
                  {
                    setState(() => title = value);
                  },
                  decoration: InputDecoration(
                      labelText: 'TITLE',
                      hintText: 'example: 1',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange))
                  ),
                ),
                SizedBox(height: 200.0),
                Material(
                  //color: Color(0xFFF7B980),
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () {
                      uploadPic(context);
                      Navigator.pop(context);
                    },
                    minWidth: 350.0,
                    height: 50.0,
                    child: Text(
                      "SUBMIT",
                      style:
                      TextStyle(
                          color: Colors.orange,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}