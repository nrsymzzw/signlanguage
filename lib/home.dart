import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Acer_User/AndroidStudioProjects/msl/lib/log/pages/admin/alphabets/alphabets.dart';
import 'file:///C:/Users/Acer_User/AndroidStudioProjects/msl/lib/log/pages/user/loginuser.dart';
import 'package:msl/log/data/service.dart';
import 'package:msl/main.dart';
import 'file:///C:/Users/Acer_User/AndroidStudioProjects/msl/lib/log/pages/admin/numbers/numbers.dart';
import 'file:///C:/Users/Acer_User/AndroidStudioProjects/msl/lib/log/pages/admin/quiz/guessit.dart';
import 'file:///C:/Users/Acer_User/AndroidStudioProjects/msl/lib/widget/bottom_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'log/pages/user/viewaccount.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

  const HomeScreen({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
}

enum BottomIcons { Home, Account, Logout}
final AuthService _authService = AuthService();

//logout
createAlertDialog(BuildContext context) {
    return AlertDialog(
      title: Text("Let's learn more?"),
      actions: <Widget>[
        FlatButton(
          onPressed:() async{
            await _authService.signOut();
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: Text('Okay'),
        ),
        FlatButton(
          onPressed: () {},
          child: Text('No'),
        ),
      ],
    );
}

class _HomeScreenState extends State<HomeScreen> {

  void _openDialog(ctx) {
    showCupertinoDialog(
        context: ctx,
        builder: (_) => CupertinoAlertDialog(
          title: Text("Let's learn more?"),
          actions: [
            // Close the dialog
            // You can use the CupertinoDialogAction widget instead
            CupertinoButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                }),
            CupertinoButton(
              child: Text('No'),
              onPressed:() async{
                await _authService.signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
              },
            )
          ],
        ));
  }

  BottomIcons bottomIcons = BottomIcons.Home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Stack(
            children: <Widget>[
              bottomIcons == BottomIcons.Home
                  ? Column(
                      children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
                          child: Text(
                            'Jom \nFingerspelling',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 50.0,
                              fontFamily: "Montserrat-ExtraBold",
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 435,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Alphabets(),
                            Numbers(),
                            Guessit(),
                          ],
                        ),
                      ),
                      ],
              )
                  : Container(),
              (bottomIcons == BottomIcons.Account)
                  ? Container(
                      child: viewAccount()
              ) : Container(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.only(left: 54, right: 54, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      BottomBar(
                          onPressed: () {
                            setState(() {
                              bottomIcons = BottomIcons.Home;
                            });
                          },
                          bottomIcons:
                          bottomIcons == BottomIcons.Home ? true : false,
                          icons: EvaIcons.homeOutline,
                          text: "Home"),
                      BottomBar(
                          onPressed: () {
                            setState(() {
                              bottomIcons = BottomIcons.Account;
                            });
                          },
                          bottomIcons:
                          bottomIcons == BottomIcons.Account ? true : false,
                          icons: EvaIcons.personOutline,
                          text: "Account"),
                      BottomBar(
                          onPressed: () => _openDialog(context),
                          bottomIcons:
                          bottomIcons == BottomIcons.Logout ? true : false,
                          icons: EvaIcons.logOutOutline,
                          text: "Logout"),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
  }
}