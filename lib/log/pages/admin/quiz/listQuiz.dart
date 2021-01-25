import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:msl/log/pages/admin/quiz/alphquizsetting.dart';
import 'package:msl/home.dart';
import 'package:msl/log/pages/admin/quiz/createquiz.dart';
import 'package:msl/log/pages/admin/quiz/editQuiz.dart';

class ListQuiz extends StatefulWidget {
  @override
  _ListQuizState createState() => _ListQuizState();
}

class _ListQuizState extends State<ListQuiz> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Play Quiz',
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
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        elevation: 10,
        titleSpacing: 85,
        toolbarHeight: 80.0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFF7B980),
        child: Icon(Icons.add, color: Colors.black),
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => CreateQuiz()));
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddoQuiz()));
        },
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
                                                icon: Icon(EvaIcons.editOutline),
                                                color: Colors.white,
                                                iconSize: 35.0,
                                                padding: EdgeInsets.only(left: 115),
                                                onPressed: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditQuiz(doc:doc)));
                                                }
                                            ),
                                            IconButton(
                                                icon: Icon(Icons.videogame_asset_outlined),
                                                color: Colors.white,
                                                iconSize: 35.0,
                                                padding: EdgeInsets.only(left: 35),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(builder: (context) => Quiz1()));
                                                }
                                            ),
                                            IconButton(
                                                icon: Icon(Icons.videogame_asset_outlined),
                                                color: Colors.white,
                                                iconSize: 35.0,
                                                padding: EdgeInsets.only(left: 35),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(builder: (context) => Quiz1()));
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