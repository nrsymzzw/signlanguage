import 'package:flutter/material.dart';
import 'package:msl/log/pages/user/guessitInfo.dart';

class GuessitUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35),
      height: 450,
      child: Stack(
        children: <Widget>[
          Center(
            child: Card(
              margin: EdgeInsets.only(top: 60),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AlphQuizHome(),
                  ),
                ),
                child: Container(
                  width: 230,
                  //color: Color(0xFF9aa1cd),
                  color: Color(0xFFF8C889),
                  //color: Colors.white70,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Center(
                  child: Container(
                    height: 180,
                    width: 180,
                    child: ClipRRect(
                      child: Image.asset('assets/idea.png'),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 25),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Guess It',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Done learning?\nLet's Test!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 80),
                    Text(
                      'Play Now',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}