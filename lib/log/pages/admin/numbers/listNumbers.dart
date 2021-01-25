import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Acer_User/AndroidStudioProjects/msl/lib/log/pages/admin/alphabets/editAlphabets.dart';
import 'package:msl/log/pages/admin/numbers/create_numbers.dart';
import 'package:msl/log/pages/admin/numbers/editNumbers.dart';

class ListNumbers extends StatefulWidget {
  @override
  _ListNumbersState createState() => _ListNumbersState();
}

class _ListNumbersState extends State<ListNumbers> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numbers',
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
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 10,
        titleSpacing: 85,
        toolbarHeight: 80.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.black),
        backgroundColor: Color(0xFFF7B980),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddNumbers()));
        },
      ),
      body: Container (
          child: StreamBuilder (
              stream: Firestore.instance.collection("Number").snapshots(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : Container(
                  //padding: EdgeInsets.all(4),
                  child: GridView.builder(
                      itemCount: snapshot.data.documents.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      padding: EdgeInsets.only(left: 5, right: 5, top:10, bottom: 0),
                      itemBuilder: (BuildContext context, int index) {
                        DocumentSnapshot doc = snapshot.data.documents[index];
                        return Container (
                          child: new Card (
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            //elevation: 5.0,
                            child: new RaisedButton (
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              color: Colors.white,
                              child: Column (
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Image.network(
                                    doc.data['url'],
                                    height: 160.0,
                                    width: 190.0,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left:63.0),
                                      child: Text(doc.data['title'],
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontFamily: "Jeko Bold",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EditNumbers(doc:doc)));
                              },
                            ),
                          ),
                        );
                      }),
                );
              }
          )
      ),
    );
  }
}