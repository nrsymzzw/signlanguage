import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class EditQuiz extends StatefulWidget {

  DocumentSnapshot doc;
  EditQuiz({Key key, this.doc}) : super(key: key);

  @override
  _EditQuizState createState() => _EditQuizState(doc);
}

class _EditQuizState extends State<EditQuiz> {

  DocumentSnapshot doc;

  _EditQuizState(DocumentSnapshot doc){
    this.doc = doc;
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController urlController;
  TextEditingController titleController;
  TextEditingController descriptionController;

  String imgUrl;
  String title;
  String desc;

  void initState(){
    super.initState();
    urlController = TextEditingController(text: widget.doc.data['imgUrl']);
    titleController = TextEditingController(text: widget.doc.data['title']);
    descriptionController = TextEditingController(text: widget.doc.data['desc']);
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Edit Quiz',
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
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: urlController,
                    decoration: InputDecoration(
                        labelText: 'IMAGE URL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange))
                    ),
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                        labelText: 'TITLE',
                        hintText: 'example: PART C',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange))
                    ),
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                        labelText: 'DESCRIPTION',
                        hintText: 'example: Fun to play.',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange))
                    ),
                  ),
                  SizedBox(height: 300),
                  GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState.validate()) {
                        Firestore.instance.collection("Quizs").document(doc.data['id']).updateData({
                          'imgUrl' : urlController.text,
                          'title': titleController.text,
                          'desc' : descriptionController.text
                        }).then ((value) async {
                          Navigator.pop(context);
                          print('edit jadi');
                        });
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 24, vertical: 20),
                      decoration: BoxDecoration(
                          color: Color(0xFFF7B980),
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "EDIT QUIZ",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],)
              ,),
          ),
        ),
      );

  }
}