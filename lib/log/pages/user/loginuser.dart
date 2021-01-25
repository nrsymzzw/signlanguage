import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:msl/log/pages/user/homeUser.dart';
import 'package:msl/signup.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool loading = false;
  String email = '', password = '', error = '';
  String email_pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('Login',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontFamily: 'Montserrat-ExtraBold',
                            fontWeight: FontWeight.w900)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(220.0, 110.0, 0.0, 0.0),
                    child: Text('.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF7B980))),
                  )
                ],
              ),
            ),

            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Form(
                  key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: (value)
                      {
                        if(value.isEmpty || !value.contains('@'))
                        {
                          return 'Invalid email.';
                        }
                        return null;
                      },
                      onChanged: (value)
                      {
                        setState(() => email = value);
                      },
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange))
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      validator: (value)
                      {
                        if(value.isEmpty || value.length<=6)
                        {
                          return 'Password must be longer.';
                        }
                        return null;
                      },
                      onChanged: (value)
                      {
                        setState(() => password = value);
                      },
                      decoration: InputDecoration(
                          labelText: 'PASSWORD ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange))
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 5.0),
                    SizedBox(height: 40.0),
                    Container(
                      height: 50.0,
                      child: Material(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30.0),
                        child: MaterialButton(
                          onPressed: () async {
                            if( _formKey.currentState.validate()){
                              setState(() => loading = true);
                              dynamic result = await _auth.signInWithEmailAndPassword(email: email, password: password);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeUserScreen()));
                              if (result == null){
                                setState(() {
                                  error = 'Try again.';
                                  loading = false;
                                });
                              }
                            }
                          },
                          minWidth: 350.0,
                          height: 50.0,
                          child: Text(
                            "LOGIN",
                            style:
                            TextStyle(
                                color: Colors.orange,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),

                  ],
                ))),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'No account yet ?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>SignupPage()));
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.orange,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            )
          ],
        )
    );
  }
}

