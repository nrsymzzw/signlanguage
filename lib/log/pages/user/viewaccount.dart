import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Acer_User/AndroidStudioProjects/msl/lib/log/pages/user/editaccount.dart';

class viewAccount extends StatefulWidget {
  @override
  _viewAccountState createState() => _viewAccountState();
}

final FirebaseAuth auth = FirebaseAuth.instance;

Stream<QuerySnapshot> getUser(BuildContext context) async* {
  final FirebaseUser rd = await auth.currentUser();
  yield* Firestore.instance.collection("User").where('uid',isEqualTo: rd.uid).snapshots();
}

class _viewAccountState extends State<viewAccount> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: StreamBuilder(
              stream: getUser(context),
              builder: (context, snapshot) {
              return snapshot.data == null
              ? Container()
                  : ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (BuildContext context, int index)
                      {
                        DocumentSnapshot ds = snapshot.data.documents[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditUser(ds:ds)));
                              },
                                child: Container(
                                    child: new Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      elevation: 5.0,
                                      margin: EdgeInsets.only(top:180.0, left: 15, right: 15),
                                      color: Color(0xFFF8C889),
                                        child: Column(
                                          children: <Widget>[
                                            SizedBox(height: 30.0),
                                                Text("USERNAME",
                                                    style: TextStyle(
                                                      fontSize: 19.0,
                                                      fontFamily: "Montserrat",
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                  Text(ds['username'],
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontFamily: "Montserrat",
                                                    ),
                                                  ),
                                            SizedBox(height: 30.0),
                                                  Text("EMAIL",
                                                    style: TextStyle(
                                                      fontSize: 19.0,
                                                      fontFamily: "Montserrat",
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                  Text(ds['email'],
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontFamily: "Montserrat",
                                                    ),
                                                  ),
                                            SizedBox(height: 30.0),
                                                  Text("PASSWORD",
                                                    style: TextStyle(
                                                      fontSize: 19.0,
                                                      fontFamily: "Montserrat",
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                  Text(ds['password'],
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontFamily: "Montserrat",
                                                    ),
                                                  ),
                                            SizedBox(height: 30.0),
                                          ],
                                        ),
                                    ),
                                ),
                              );
                      },
                  );
              }
          ),
        )
    );
  }
}