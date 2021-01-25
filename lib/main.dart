import 'package:flutter/material.dart';
import 'package:msl/chooseLogin.dart';
import 'file:///C:/Users/Acer_User/AndroidStudioProjects/msl/lib/log/pages/user/loginuser.dart';
import 'package:msl/widget/background.dart';
import 'package:msl/widget/roundedButton.dart';
import 'package:msl/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      //routes: routes,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/signlogo.png",
              height: 120.0,
            ),
            SizedBox(height: 10.0),

            Image.asset(
              "assets/wording.png",
              height: 120.0,
            ),

            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {return ChooseLogin();},
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: Color(0xFFF7B980),
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignupPage();},
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}