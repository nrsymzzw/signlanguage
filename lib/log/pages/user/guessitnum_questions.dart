import 'dart:async';

import 'package:flutter/material.dart';
import 'package:msl/log/pages/user/guessitInfo.dart';

var finalScore = 0;
var questionNumber = 0;
var quiz = new NumQuiz();

class NumQuiz{
  var images = [
    "plus1",
    "minus3",
    "times2",
    "plus10",
    "times54",
    "minus4",
    "times12",
    "plus19",
    "minus7",
    "times24",
  ];


  var questions = [
    "Answer :",
    "Answer :",
    "Answer :",
    "Answer :",
    "Answer :",
    "Answer :",
    "Answer :",
    "Answer :",
    "Answer :",
    "Answer :"
  ];


  var choices = [
    ["3", "1", "0", "2"],
    ["1", "4", "2", "3"],
    ["2", "4", "5", "8"],
    ["9", "10", "7", "11"],
    ["60", "72", "54", "50"],
    ["6", "2", "3", "4"],
    ["15", "12", "20", "13"],
    ["22", "24", "19", "18"],
    ["19", "30", "7", "14"],
    ["24", "12", "34", "50"]
  ];


  var correctAnswers = [
    "1", "3", "2", "10", "54", "4", "12", "19", "7", "24"
  ];
}

class NumQuiz1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new NumQuiz1State();
  }
}

class NumQuiz1State extends State<NumQuiz1> {

  int _counter = 30;
  Timer _timer;

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
                SizedBox(height: 35),
                new Text('Calculate the number shown above.',
                  style: new TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Montserrat'
                  ),),

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
      if(questionNumber == quiz.questions.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Summary(score: finalScore,)));

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
                          .push(MaterialPageRoute(builder: (context) => NumQuiz1()));
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