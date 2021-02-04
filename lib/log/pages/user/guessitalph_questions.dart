import 'dart:async';

import 'package:flutter/material.dart';
import 'package:msl/log/pages/user/guessitInfo.dart';

var finalScore = 0;
var questionNumber = 0;
var quiz = new AlphQuiz();

class AlphQuiz{
  var images = [
    "drink",
    "eat",
    "sleep",
    "read",
    "chores",
    "rest",
    "listen",
    "name",
    "okay",
    "thank"
  ];


  var questions = [
    "Megat is _________ water because he is thirsty.",
    "Salmah want to _________ fast food for dinner.",
    "Nana always _________ late because she is having a hard time to close her eyes peacefully.",
    "Bob likes to _________ books with variety of genres, especially thriller.",
    "Alia likes to do _________ to keep the house neat and clean.",
    "After a long day at work, Ahmad finally get to _________.",
    "Lily likes to _________ to songs, especially K-POP.",
    "Choose the correct answer :",
    "Choose the correct answer :",
    "Choose the correct answer :"
  ];


  var choices = [
    ["drinking", "showering", "eating", "spitting"],
    ["sleep", "eat", "dance", "drink"],
    ["eat", "sleep", "shower", "dance"],
    ["eat", "talk", "spit", "read"],
    ["shower", "sleep", "chores", "drink"],
    ["meet", "rest", "talk", "read"],
    ["listen", "sleep", "dance", "chores"],
    ["your age", "your eyes", "your name", "your height"],
    ["you good", "you mad", "you talk", "you okay"],
    ["welcome", "thank you", "goodbye", "hello"]
  ];


  var correctAnswers = [
    "drinking",
    "eat",
    "sleep",
    "read",
    "chores",
    "rest",
    "listen",
    "your name",
    "you okay",
    "thank you"
  ];
}

class AlphQuiz1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new AlphQuiz1State();
  }
}

class AlphQuiz1State extends State<AlphQuiz1> {

  int _counter = 30;
  Timer _timer;

  /*void _startTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
        }
      });
    });
  }*/

  void _openWrongDialog(ctx) {
    showDialog(
        context: ctx,
        builder: (_) => AlertDialog(
          content: Image.asset("assets/wrong.png",
            height: 160.0,
            width: 190.0,),
          actions: [
            Container(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                  minWidth: 250.0,
                  height: 50.0,
                  //color: Color(0xFFF7B980),
                  color: Color(0xFFff5d7d),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  onPressed: ()=> {
                    Navigator.of(context).pop()
                  },
                  child: new Text("TRY AGAIN",
                    style: new TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),)
              )
            ),
          ],
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
        ),
        barrierDismissible: false,
    );
  }

  void _openCorrectDialog(ctx) {
    showDialog(
        context: ctx,
        builder: (_) => AlertDialog(
          content: Image.asset("assets/tick.png",
            height: 160.0,
            width: 190.0,),
          actions: [
            Container(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                    minWidth: 250.0,
                    height: 50.0,
                    //color: Color(0xFFF7B980),
                    color: Color(0xFFcbe558),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    onPressed: ()=> {
                      finalScore++,
                      updateQuestion(),
                      Navigator.of(context).pop()
                    },
                    child: new Text("NEXT",
                      style: new TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),)
                )
            ),
          ],
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
        ),
        barrierDismissible: false,
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        if (_counter < 1) {
          t.cancel();
          updateQuestion();
        } else {
          _counter = _counter - 1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        //onWillPop: () async => false,
        onWillPop: () {
          _timer.cancel();
          return Future.value(true);
        },
        child: Scaffold(
          body: new Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(20.0)),

                new Container(
                  alignment: Alignment.centerRight,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text("Question ${questionNumber + 1} of ${quiz.questions.length}",
                        style: new TextStyle(
                            fontSize: 22.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold
                        ),),

                      new Text("$_counter",
                        style: new TextStyle(
                            fontSize: 22.0,
                            color: Colors.deepOrangeAccent,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold
                        ),),

                      new Text("Score: $finalScore",
                        style: new TextStyle(
                            fontSize: 22.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold
                        ),)
                    ],
                  ),
                ),

                //image
                new Padding(padding: EdgeInsets.all(10.0)),

                new Image.asset(
                  "assets/${quiz.images[questionNumber]}.jpg",
                  //height: 150,
                  //width: 300,
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Text(quiz.questions[questionNumber],
                  style: new TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Montserrat'
                  ),),

                new Padding(padding: EdgeInsets.all(10.0)),
                new SizedBox(height: 25),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //button 1
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      height: 45,
                      onPressed: (){
                        if(quiz.choices[questionNumber][0] == quiz.correctAnswers[questionNumber]){
                          debugPrint("Correct");
                          _openCorrectDialog(context);
                        }else{
                          debugPrint("Wrong");
                          _openWrongDialog(context);
                        }

                      },
                      child: new Text(quiz.choices[questionNumber][0],
                        style: new TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),),
                    ),

                    //button 2
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      height: 45,
                      onPressed: (){

                        if(quiz.choices[questionNumber][1] == quiz.correctAnswers[questionNumber]){
                          debugPrint("Correct");
                          _openCorrectDialog(context);
                        }else{
                          debugPrint("Wrong");
                          _openWrongDialog(context);
                        }

                      },
                      child: new Text(quiz.choices[questionNumber][1],
                        style: new TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),),
                    ),

                  ],
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //button 3
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      height: 45,
                      onPressed: (){

                        if(quiz.choices[questionNumber][2] == quiz.correctAnswers[questionNumber]){
                          debugPrint("Correct");
                          _openCorrectDialog(context);
                        }else{
                          debugPrint("Wrong");
                          _openWrongDialog(context);
                        }

                      },
                      child: new Text(quiz.choices[questionNumber][2],
                        style: new TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),),
                    ),

                    //button 4
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      height: 45,
                      onPressed: (){

                        if(quiz.choices[questionNumber][3] == quiz.correctAnswers[questionNumber]){
                          debugPrint("Correct");
                          _openCorrectDialog(context);
                        }else{
                          debugPrint("Wrong");
                          _openWrongDialog(context);
                        }
                      },
                      child: new Text(quiz.choices[questionNumber][3],
                        style: new TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),),
                    ),
                  ],
                ),

                new Padding(padding: EdgeInsets.all(15.0)),

                new Container(
                    alignment: Alignment.bottomCenter,
                    child:  new MaterialButton(
                        minWidth: 290.0,
                        height: 50.0,
                        color: Color(0xFFF7B980),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => AlphQuizHome()));
                        },
                        child: new Text("EXIT QUIZ",
                          style: new TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),)
                    )
                ),
              ],
            ),
          ),

        )
    );
  }

  void resetQuiz(){
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }

  /*void updateQuestion(){
    setState(() {
      if(questionNumber == quiz.questions.length - 1) {
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) => new Summary(score: finalScore)));
        }else{
        questionNumber++;
      }
    });
  }*/

  void updateQuestion(){
    //_timer.cancel();
    setState(() {
      if(questionNumber < quiz.questions.length - 1) {
        questionNumber++;
        _counter = 30;

        _startTimer();
      }else{
        _timer.cancel();
        Navigator.push(context, new MaterialPageRoute(
            builder: (context) => new Summary(score: finalScore)));
      }
    });
  }
}


class Summary extends StatelessWidget{
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Final Score : $score",
                  style: new TextStyle(
                      fontSize: 35.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold
                  )
              ),

              new Padding(padding: EdgeInsets.all(30.0)),

              Row(
                children: [
                  SizedBox(width: 15),
                  new MaterialButton(
                    height: 50.0,
                    minWidth: 170,
                    color: Color(0xFFF7B980),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    onPressed: (){
                      questionNumber = 0;
                      finalScore = 0;
                      //Navigator.pop(context);
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => AlphQuiz1()));
                    },
                    child: new Text("PLAY AGAIN",
                      style: new TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),),),
                  SizedBox(width: 20),
                  new MaterialButton(
                    height: 50.0,
                    minWidth: 170,
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => AlphQuizHome()));
                    },
                    child: new Text("EXIT QUIZ",
                      style: new TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.orange
                      ),),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


}