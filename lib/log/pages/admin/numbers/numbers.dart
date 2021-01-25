import 'package:flutter/material.dart';
import 'package:msl/log/pages/admin/numbers/listNumbers.dart';

class Numbers extends StatelessWidget {
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
                    //builder: (_) => numbersInfo(),
                    builder: (_) => ListNumbers(),
                  ),
                ),
                child: Container(
                  width: 230,
                  //color: Color(0xFFB7E3A1),
                  //color: Color(0xFFF7B980),
                  color: Colors.white70,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Center(
                  child: Container(
                    height: 180,
                    width: 180,
                    child: ClipRRect(
                      child: Image.asset('assets/cubes.png'),
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
                      'Numbers',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Numbers from 1 \nto 10',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 80),
                    Text(
                      'Learn Now',
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