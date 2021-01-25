import 'package:flutter/material.dart';

class alphabetsInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alphabets',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontFamily: "Jeko Bold",
            fontWeight: FontWeight.w700,
          ),
        ),
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
        /*shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)
            )
        ), */
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
                            Image.asset("assets/A.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("A a",
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
                            Image.asset("assets/B.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("B b",
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
                            Image.asset("assets/C.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("C c",
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
                            Image.asset("assets/D.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("D d",
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
                            Image.asset("assets/E.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("E e",
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
                            Image.asset("assets/F.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("F f",
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
                            Image.asset("assets/G.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("G g",
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
                            Image.asset("assets/H.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("H h",
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
                            Image.asset("assets/I.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("I i",
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
                            Image.asset("assets/J.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("J j",
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
                            Image.asset("assets/K.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("K k",
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
                            Image.asset("assets/L.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("L l",
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
                            Image.asset("assets/M.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("M m",
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
                            Image.asset("assets/N.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("N n",
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
                            Image.asset("assets/O.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("O o",
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
                            Image.asset("assets/P.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("P p",
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
                            Image.asset("assets/Q.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("Q q",
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
                            Image.asset("assets/R.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("R r",
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
                            Image.asset("assets/S.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("S s",
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
                            Image.asset("assets/T.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("T t",
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
                            Image.asset("assets/U.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("U u",
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
                            Image.asset("assets/V.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("V v",
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
                            Image.asset("assets/W.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("W w",
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
                            Image.asset("assets/X.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("X x",
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
                            Image.asset("assets/Y.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("Y y",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontFamily: "Jeko Bold",
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black
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
                            Image.asset("assets/Z.png",
                              height: 160.0,
                              width: 190.0,
                              //fit: BoxFit.fitHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Text("Z z",
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
          ),


    );
  }
}