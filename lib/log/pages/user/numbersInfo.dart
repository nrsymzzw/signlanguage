import 'package:flutter/material.dart';

class numbersInfo extends StatelessWidget {
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
          titleSpacing: 85,
          toolbarHeight: 80.0,
        ),

        body: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.only(left: 10, right: 10, top:15, bottom:
            15),
            childAspectRatio: MediaQuery.of(context).size.height / 900,

            children: <Widget> [
            new Container (
            child: new Card (
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: new Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset("assets/0.png",
                      height: 160.0,
                      width: 200.0,
                      //fit: BoxFit.fitHeight,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 80.0),
                        child: Text("0",
                          style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: "Jeko Bold",
                            fontWeight: FontWeight.w700,
                          ),
                        )
                    )
                  ],
                )
            )
          ),

              new Container (
                  child: new Card (
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: new Column (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset("assets/1.png",
                            height: 160.0,
                            width: 200.0,
                            //fit: BoxFit.fitHeight,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 80.0),
                              child: Text("1",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontFamily: "Jeko Bold",
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                          )
                        ],
                      )
                  )
              ),

              new Container (
                  child: new Card (
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: new Column (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset("assets/2.png",
                            height: 160.0,
                            width: 200.0,
                            //fit: BoxFit.fitHeight,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 80.0),
                              child: Text("2",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontFamily: "Jeko Bold",
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                          )
                        ],
                      )
                  )
              ),

              new Container (
                  child: new Card (
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: new Column (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset("assets/3.png",
                            height: 160.0,
                            width: 200.0,
                            //fit: BoxFit.fitHeight,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 80.0),
                              child: Text("3",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontFamily: "Jeko Bold",
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                          )
                        ],
                      )
                  )
              ),

              new Container (
                  child: new Card (
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: new Column (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset("assets/4.png",
                            height: 160.0,
                            width: 200.0,
                            //fit: BoxFit.fitHeight,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 80.0),
                              child: Text("4",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontFamily: "Jeko Bold",
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                          )
                        ],
                      )
                  )
              ),

              new Container (
                  child: new Card (
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: new Column (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset("assets/5.png",
                            height: 160.0,
                            width: 200.0,
                            //fit: BoxFit.fitHeight,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 80.0),
                              child: Text("5",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontFamily: "Jeko Bold",
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                          )
                        ],
                      )
                  )
              ),

              new Container (
                  child: new Card (
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: new Column (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset("assets/6.png",
                            height: 160.0,
                            width: 200.0,
                            //fit: BoxFit.fitHeight,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 80.0),
                              child: Text("6",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontFamily: "Jeko Bold",
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                          )
                        ],
                      )
                  )
              ),

              new Container (
                  child: new Card (
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: new Column (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset("assets/7.png",
                            height: 160.0,
                            width: 200.0,
                            //fit: BoxFit.fitHeight,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 80.0),
                              child: Text("7",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontFamily: "Jeko Bold",
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                          )
                        ],
                      )
                  )
              ),

              new Container (
                  child: new Card (
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: new Column (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset("assets/8.png",
                            height: 160.0,
                            width: 200.0,
                            //fit: BoxFit.fitHeight,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 80.0),
                              child: Text("8",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontFamily: "Jeko Bold",
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                          )
                        ],
                      )
                  )
              ),

              new Container (
                  child: new Card (
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: new Column (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset("assets/9.png",
                            height: 160.0,
                            width: 200.0,
                            //fit: BoxFit.fitHeight,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 80.0),
                              child: Text("9",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontFamily: "Jeko Bold",
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                          )
                        ],
                      )
                  )
              ),

              new Container (
                  child: new Card (
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: new Column (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset("assets/10.png",
                            height: 160.0,
                            width: 200.0,
                            //fit: BoxFit.fitHeight,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 80.0),
                              child: Text("10",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontFamily: "Jeko Bold",
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                          )
                        ],
                      )
                  )
              ),


        ]
      )
    );
  }
}