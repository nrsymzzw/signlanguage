import 'package:flutter/material.dart';
import 'file:///C:/Users/Acer_User/AndroidStudioProjects/msl/lib/log/pages/user/alphabetsInfo.dart';

class AlphabetsUser extends StatelessWidget {
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
                    builder: (_) => alphabetsInfo(),
                  ),
                ),
                child: Container(
                  width: 230,
                  color: Color(0xFFF8C889),
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
                      child: Image.asset('assets/abc.png'),
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
                      'Alphabets',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Alphabets from A\nto Z',
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