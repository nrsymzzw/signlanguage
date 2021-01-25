import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:msl/log/data/database.dart';
import 'package:msl/log/model/alphabets.dart';

class EditNumbers extends StatefulWidget {

  DocumentSnapshot doc;
  EditNumbers({Key key, this.doc}) : super(key: key);

  @override
  _EditNumbersState createState() => _EditNumbersState(doc);
}

class _EditNumbersState extends State<EditNumbers> {

  DocumentSnapshot doc;

  File _image;
  _EditNumbersState(DocumentSnapshot doc){
    this.doc = doc;
  }

  TextEditingController titleController;

  final GlobalKey<FormState> _formKey = GlobalKey();
  String id;
  String title;

  void initState(){
    super.initState();
    titleController = TextEditingController(text: widget.doc.data['title']);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Numbers',
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
        titleSpacing: 73,
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
                    doc.data['url'],
                    height: 160.0,
                    width: 190.0,
                  ),
                ),
                SizedBox(height: 10.0),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: titleController,
                  /*onChanged: (newValue) {
                    setState(() {
                      title = newValue;
                      titleController.text = title;
                    });
                  },*/
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
                  color: Color(0xFFF7B980),
                  //color: Colors.black,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        /*DatabaseService().updateAlphabets(Alphabet(
                          title: titleController.text,
                        )).then ((value) async {
                          Navigator.pop(context);
                          print('edit jadi');
                        });*/

                        Firestore.instance.collection("Number").document(doc.data['id']).updateData({
                          'title': titleController.text,
                        }).then ((value) async {
                          Navigator.pop(context);
                          print('edit jadi');
                        });
                      }
                    },
                    minWidth: 350.0,
                    height: 50.0,
                    child: Text(
                      "EDIT TITLE",
                      style:
                      TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Material(
                  //color: Color(0xFFF7B980),
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () async {
                      Firestore.instance.collection("Number").document(doc.data['id']).delete();
                      Navigator.pop(context);
                    },
                    minWidth: 350.0,
                    height: 50.0,
                    child: Text(
                      "DELETE NUMBER",
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
