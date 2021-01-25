import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:msl/log/data/database.dart';
import 'package:msl/log/pages/admin/quiz/listQuiz.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {

  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {

  DatabaseService databaseService = new DatabaseService();
  final _formKey = GlobalKey<FormState>();

  String quizImgUrl, quizTitle, quizDesc;

  bool isLoading = false;
  String quizId;


  createQuiz(){
    quizId = randomAlphaNumeric(16);
    if(_formKey.currentState.validate()){

      setState(() {
        isLoading = true;
      });

      Map<String, String> quizData = {
        "quizImgUrl" : quizImgUrl,
        "quizTitle" : quizTitle,
        "quizDesc" : quizDesc
      };

      databaseService.addQuizData(quizData, quizId).then((value){
        setState(() {
          isLoading = false;
        });
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) =>  ListQuiz()
        ));
      });
    }
  }

  @override
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
                //SizedBox(height: 30),
                TextFormField(
                  validator: (val) => val.isEmpty ? "Enter Quiz Image Url" : null,
                  decoration: InputDecoration(
                      labelText: 'IMAGE URL',
                      hintText: 'example: https://www.pixelstalk.net/BackgroundHD.png',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange))
                  ),
                  onChanged: (val){
                    quizImgUrl = val;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  validator: (val) => val.isEmpty ? "Enter Quiz Title" : null,
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
                  onChanged: (val){
                    quizTitle = val;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  validator: (val) => val.isEmpty ? "Enter Quiz Description" : null,
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
                  onChanged: (val){
                    quizDesc = val;
                  },
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    createQuiz();
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
                      "ADD QUIZ",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
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