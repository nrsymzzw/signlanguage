import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:msl/log/pages/user/loginuser.dart';
import 'log/data/service.dart'; //login

class SignupPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SignupPageState();
  }
}

class _SignupPageState extends State<SignupPage> {

  final AuthService _auth = AuthService();
  bool loading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '', email = '', password = '', error = '';

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
                  child: Text(
                    'Signup',
                    style:
                    TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF7B980)),
                  ),
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
                    validator: (value) => value.isEmpty ? 'Username is required.': null,
                    onChanged: (value)
                    {
                      setState(() => username = value);
                    },
                    decoration: InputDecoration(
                        labelText: 'USERNAME',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange))
                    ),
                  ),
                  SizedBox(height: 10.0),
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
                  SizedBox(height: 10.0),
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
                  SizedBox(height: 10.0),
                  SizedBox(height: 50.0),
                  Material(
                    color: Color(0xFFF7B980),
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: ()  async {
                        if(_formKey.currentState.validate()){
                          setState(() => loading = true);
                          dynamic result = await _auth.registerWithEmailandPassword(username, email, password);
                          //Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          if(result == null){
                            setState(() {
                              error = 'Login Error.';
                              loading = false;
                            });
                          }
                        }
                        Fluttertoast.showToast(
                            msg: 'Sign Up Successfully',
                            backgroundColor: Colors.green,
                            textColor: Colors.white
                        );
                      },
                      minWidth: 350.0,
                      height: 50.0,
                      child: Text(
                        "SIGN UP",
                        style:
                        TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 50.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Center(
                          child: Text('GO BACK',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),
                      ),
                    ),
                  ),
                ],
              )),),
        ]));
  }
}
