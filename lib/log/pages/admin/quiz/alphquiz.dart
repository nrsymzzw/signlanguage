import 'package:flutter/material.dart';
import 'package:msl/log/pages/admin/quiz/alphquizsetting.dart';

class AnimalQuiz extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new AnimalQuizState();
  }
}

class AnimalQuizState extends State<AnimalQuiz>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Play Quiz',
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
      ),

      body: Column(
        children: [
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            margin: EdgeInsets.only(bottom: 10),
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  Image.network(
                    "https://th.bing.com/th/id/OIP.aafi0Tyq2VeqAkzQDPXSdAHaEK?pid=Api&rs=1",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    color: Colors.black26,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'PART A',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Let's test your alphabets. Ready?",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 15),
                          IconButton(
                              icon: Icon(Icons.videogame_asset_outlined),
                              color: Colors.white,
                              iconSize: 40.0,
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) => Quiz1()));
                              }
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            margin: EdgeInsets.only(bottom: 10),
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  Image.network(
                    "https://i.pinimg.com/originals/58/07/cb/5807cb0b5633bd3eeb974d11813a5b30.jpg",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    color: Colors.black26,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'PART B',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "How about numbers? Let's go!",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 15),
                          IconButton(
                              icon: Icon(Icons.videogame_asset_outlined),
                              color: Colors.white,
                              iconSize: 40.0,
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) => Quiz1()));
                              }
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      /*body: new Container(
        margin: const EdgeInsets.all(15.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             MaterialButton(
                height: 50.0,
                color: Colors.green,
                onPressed: startQuiz,
                child: Text("PART A : Alphabets",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white
                  ),)
            ),
            SizedBox(height: 20),
            MaterialButton(
                height: 50.0,
                color: Colors.green,
                onPressed: startQuiz,
                child: Text("PART B : Numbers",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white
                  ),)
            )
          ],
        ),
      ), */


    );
  }

  void startQuiz(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quiz1()));
    });
  }
}