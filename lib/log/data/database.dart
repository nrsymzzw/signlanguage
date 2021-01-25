import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:msl/log/model/quiz.dart';
import 'package:msl/log/model/user.dart';
import 'package:msl/log/model/alphabets.dart';
import 'package:msl/log/model/numbers.dart';

class DatabaseService{

  final CollectionReference userCollection  = Firestore.instance.collection('User');
  final CollectionReference alphCollection  = Firestore.instance.collection("Alphabet");
  final CollectionReference numCollection  = Firestore.instance.collection("Number");
  final CollectionReference quizCollection  = Firestore.instance.collection("Quizs");

  final String uid;
  final String username;
  final String email;
  final String password;

  final String alphid;
  final String numid;
  final String imageUrls;
  final String title;


  DatabaseService({this.uid, this.username, this.email, this.password, this.alphid, this.numid, this.imageUrls, this.title});

  Future createUser (User user) async {
    try{
      await userCollection.document(user.id).setData(user.toJson())
          .whenComplete(() {
        print("User created");
      });
    } catch (e) {
      return e.message;
    }
  }

  bool isLoggedIn(){
    if(FirebaseAuth.instance.currentUser() != null){
      return true;
    } else {
      return false;
    }
  }

  //get current user
  getCurrentUser() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseUser user = await auth.currentUser();
    return user;
  }

  //update profile
  Future updateProfile(String username, String email, String password) async {
    return userCollection.document(uid).updateData({
      'username': username,
      'email' : email,
      'password': password
    }).whenComplete((){
      print("Profile Updated.");
    });
  }

  Future updateUserData(String username, String email, String password) async {
    return await userCollection.document(uid).setData({
      'username' : username,
      'email' : email,
      'password' : password,
    });
  }

  Future updateUser(User newUser) async {
    return userCollection.document(newUser.id).updateData(
        newUser.toJson()).whenComplete(() {
      print("Update success!");
    });
  }

  //userData from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      username: snapshot.data['username'],
      email: snapshot.data['email'],
      password: snapshot.data['password'],
    );
  }

  //get user doc stream
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  }

  //....ALPHABETS SECTION..............................................//
  Future addAlphabets(Alphabet alph) async{
    return alphCollection.document(alph.id).setData(alph.toJson()).whenComplete(() {
      print("Add Success");
    });
  }

  Future updateAlphabets(Alphabet al)async {
    return alphCollection.document(al.id).updateData(
        al.toJson()).whenComplete(() {
      print("Update Success");
    });
  }

  Future deleteAlphabets(String id) async {
    return alphCollection
        .document(id)
        .delete();
  }
  //..................................................................//


  //....NUMBERS SECTION...............................................//
  Future addNumbers(Number num) async{
    return numCollection.document(num.id).setData(num.toJson()).whenComplete(() {
      print("Add Success");
    });
  }

  Future updateNumbers(Number no)async {
    return numCollection.document(no.id).updateData(
        no.toJson()).whenComplete(() {
      print("Update Success");
    });
  }

  Future deleteNumbers(String id) async {
    return numCollection.document(id).delete();
  }
  //..................................................................//


  //....QUIZ SECTION...............................................//
  Future addQuizs(Quiz qu) async{
    return quizCollection.document(qu.id).setData(qu.toJson()).whenComplete(() {
      print("Add Success");
    });
  }
  //..................................................................//


  //....QUIZ MCQ SECTION..................................................//
  Future<void> addQuizData(Map quizData, String quizId) async {
    await Firestore.instance
        .collection("Quiz")
        .document(quizId)
        .setData(quizData)
        .catchError((e) {
      print(e);
    });
  }

  Future<void> addQuestionData(quizData, String quizId) async {
    await Firestore.instance
        .collection("Quiz")
        .document(quizId)
        .collection("QNA")
        .add(quizData)
        .catchError((e) {
      print(e);
    });
  }

  getQuizData() async {
    return await Firestore.instance.collection("Quiz").snapshots();
  }

  getQuestionData(String quizId) async{
    return await Firestore.instance
        .collection("Quiz")
        .document(quizId)
        .collection("QNA")
        .getDocuments();
  }

}