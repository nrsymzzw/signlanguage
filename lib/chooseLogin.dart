import 'package:flutter/material.dart';
import 'file:///C:/Users/Acer_User/AndroidStudioProjects/msl/lib/log/pages/user/loginuser.dart';
import 'package:msl/log/pages/admin/loginadmin.dart';
import 'package:msl/widget/background.dart';
import 'package:msl/widget/roundedButton.dart';

class ChooseLogin extends StatelessWidget {
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
              text: "USER",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "ADMIN",
              color: Color(0xFFF7B980),
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginAdminPage();},
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