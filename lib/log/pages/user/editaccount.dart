import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditUser extends StatefulWidget {

  DocumentSnapshot ds;
  EditUser({Key key, this.ds}) : super(key: key);

  @override
  _EditUserState createState() => _EditUserState(ds);
}

class _EditUserState extends State<EditUser> {

  DocumentSnapshot ds;

  _EditUserState(DocumentSnapshot ds){
    this.ds = ds;
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerPw = new TextEditingController();

  @override
  void initState(){
    super.initState();
    controllerName = TextEditingController(text: widget.ds.data['username']);
    controllerEmail = TextEditingController(text: widget.ds.data['email']);
    controllerPw =TextEditingController(text: widget.ds.data['password']);
  }

  String username, email, password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Update Account',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontFamily: "Jeko Bold",
                fontWeight: FontWeight.w700,
              ),
            ),
            //backgroundColor: Color(0xFFB7E3A1),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.black,
              iconSize: 30.0,
              padding: EdgeInsets.only(left: 25),
              onPressed: () => Navigator.pop(context),
            ),
            elevation: 10,
            titleSpacing: 60,
            toolbarHeight: 80.0,
          ),
          body: Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: controllerName,
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
                      SizedBox(height: 25),
                      TextFormField(
                        controller: controllerEmail,
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
                      SizedBox(height: 25),
                      TextFormField(
                        controller: controllerPw,
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange))
                        ),
                      ),
                      SizedBox(height: 60),
                      Material(
                        color: Color(0xFFF7B980),
                        borderRadius: BorderRadius.circular(30.0),
                        child: MaterialButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              Firestore.instance.collection("User").document(ds.data['uid']).updateData({
                                'username': controllerName.text,
                                'email': controllerEmail.text,
                                'password': controllerPw.text,
                              }).then ((value) async {
                                Navigator.pop(context);
                                print('edit jadi');
                              });
                            }
                          },
                          minWidth: 350.0,
                          height: 50.0,
                          child: Text(
                            "SUBMIT",
                            style:
                            TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),

              ),
            ),
          )
      ),
    );
  }
}