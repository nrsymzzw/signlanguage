import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:msl/log/data/database.dart';
import 'package:msl/log/model/quiz.dart';
import 'package:flutter/rendering.dart';


class AddoQuiz extends StatefulWidget {
  @override _AddoQuizState createState() => _AddoQuizState();
}

class _AddoQuizState extends State<AddoQuiz> {

  String imgUrl = "";
  String title = "";
  String desc = "";
  String id = "";

  Quiz quo;
  bool loading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add Quiz',
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
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(height: 30),
                TextFormField(
                  validator: (val) => val.isEmpty ? "Enter Quiz Image Url" : null,
                  onChanged: (val){
                    setState(() => imgUrl = val) ;
                  },
                  decoration: InputDecoration(
                      labelText: 'IMAGE URL',
                      //hintText: 'example: https://www.pixelstalk.net/BackgroundHD.png',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange))
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  validator: (val) => val.isEmpty ? "Enter Quiz Title" : null,
                  onChanged: (val){
                    setState(() => title = val);
                  },
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
                SizedBox(height: 15),
                TextFormField(
                  validator: (val) => val.isEmpty ? "Enter Quiz Description" : null,
                  onChanged: (val){
                    setState(() => desc = val);
                  },
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
                SizedBox(height: 315),
                GestureDetector(
                  onTap: () async {
                    if(_formKey.currentState.validate()) {
                      setState(() => loading = true);
                      String id = Firestore.instance.collection("Quizs").document().documentID;
                      quo = Quiz(
                        id: id,
                        imgUrl: imgUrl,
                        title: title,
                        desc: desc
                      );
                      await DatabaseService().addQuizs(quo);
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(
                        horizontal: 24, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
              ],)
            ,),
        ),
      ),
    );
  }
}