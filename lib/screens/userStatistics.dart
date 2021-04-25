import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tutor/rewidgets/navBar.dart';
import '../rewidgets/reusableCard.dart';

const activeCardColour = Colors.black45;
const inactiveCardColour = Color(0xFF111328);
final joined = 'xx/xx/xx';
final int quizNum = 69;
final lastChapter = 3;
final difficulty = 'Hard';
final int quizMax = 9;
final int quizAvg = 7;

class UserStatistics extends StatefulWidget {
  @override
  _UserStatistics createState() => _UserStatistics();
}

class _UserStatistics extends State<UserStatistics> {
  @override
  _UserStatistics createState() => _UserStatistics();
  Widget build(BuildContext context) {
    return SafeArea(
      // child: Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: Alignment.bottomLeft,
      //         end: Alignment.topRight,
      //         colors: [Colors.black, Colors.blue]),
      //   ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Statistics'),
          centerTitle: true,
        ),
        bottomNavigationBar: NavBar(),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColour,
                      cardChild: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'JOINED ON:',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                            width: 150,
                            child: Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            joined,
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColour,
                      cardChild: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'QUIZZES CLEARED:',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                            width: 150,
                            child: Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            quizNum.toString(),
                            style: TextStyle(
                              fontSize: 50.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColour,
                      cardChild: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'LAST COMPLETED CHAPTER:',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                            width: 300,
                            child: Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Chapter $lastChapter($difficulty)',
                            style: TextStyle(
                              fontSize: 40.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColour,
                      cardChild: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'AVERAGE SCORE:',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                            width: 150,
                            child: Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '$quizAvg',
                            style: TextStyle(
                              fontSize: 50.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColour,
                      cardChild: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'HIGHEST SCORE:',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                            width: 150,
                            child: Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '$quizMax',
                            style: TextStyle(
                              fontSize: 50.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
