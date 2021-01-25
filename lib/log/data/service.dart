import 'package:firebase_auth/firebase_auth.dart';
import 'package:msl/log/model/user.dart';
import 'package:msl/log/data/database.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User _usern;

  User get currentUser => _usern;

  //create user object based on firebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(id: user.uid) : null;
  }

  //get uid
  Future getCurrentUser() async {
    return await _firebaseAuth.currentUser();
  }

  // GET UID
  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser()).uid;
  }

  // auth change user stream
  Stream<User> get user{
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // sign in anonymously
  Future signInAnon() async {
    try {
      AuthResult result = await _firebaseAuth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch (e) {
      print(e.toString());
    }
    print('add');
  }

  // register with email & password
  Future registerWithEmailandPassword(String username, String email, String password) async {
    try {
      AuthResult  result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      _usern = User(
          id: user.uid,
          username: username,
          email: email,
          password: password
      );

      await DatabaseService().createUser(_usern);
      print(_usern.id);

      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async{
    try{
      return await _firebaseAuth.signOut();
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }
}