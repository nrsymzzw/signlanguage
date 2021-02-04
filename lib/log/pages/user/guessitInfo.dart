import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:msl/log/pages/admin/quiz/alphquizsetting.dart';
import 'package:msl/home.dart';
import 'package:msl/log/pages/admin/quiz/createquiz.dart';
import 'package:msl/log/pages/admin/quiz/editQuiz.dart';
import 'package:msl/log/pages/user/guessitalph_questions.dart';
import 'package:msl/log/pages/user/guessitnum_questions.dart';
import 'package:msl/log/pages/user/homeUser.dart';

class AlphQuizHome extends StatefulWidget {
  @override
  _AlphQuizHomeState createState() => _AlphQuizHomeState();
}

class _AlphQuizHomeState extends State<AlphQuizHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Play Now',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontFamily: "Jeko Bold",
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          iconSize: 30.0,
          padding: EdgeInsets.only(left: 25),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeUserScreen()));
          },
        ),
        elevation: 10,
        titleSpacing: 85,
        toolbarHeight: 80.0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            StreamBuilder(
              stream: Firestore.instance.collection("Quizs").snapshots(),
              builder: (context, snapshot) {
                return snapshot.data == null
                    ? Container()
                    : ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot doc = snapshot.data.documents[index];
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        margin: EdgeInsets.only(bottom: 10),
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            children: [
                              Image.network(
                                doc.data['imgUrl'],
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                color: Colors.black26,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        doc.data['title'],
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        doc.data['desc'],
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: 15),
                                      Container(
                                        child: Row(
                                          children: [
                                            IconButton(
                                                icon: Icon(Icons.videogame_asset_outlined),
                                                color: Colors.transparent,
                                                iconSize: 35.0,
                                                padding: EdgeInsets.only(left: 115),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(builder: (context) => AlphQuiz1()));
                                                }
                                            ),
                                            IconButton(
                                                icon: Icon(Icons.videogame_asset_outlined),
                                                color: Colors.transparent,
                                                iconSize: 35.0,
                                                padding: EdgeInsets.only(left: 35),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(builder: (context) => NumQuiz1()));
                                                }
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}