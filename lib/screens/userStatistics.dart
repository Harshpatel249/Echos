import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tutor/rewidgets/navBar.dart';
import '../rewidgets/reusableCard.dart';
import 'userProfile.dart';

const starting = Color(0xFF3B97FE);
const ending = Color(0xFF13DFEF);
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
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Statistics',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: NavBar(
          id: UserProfile.id,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour1: Color(0xFF075FF3),
                      colour2: Color(0xFF3B97FE),
                      cardChild: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Joined On:',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
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
                            joined,
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour1: Color(0xFF3B97FE),
                      colour2: Color(0xFF13DFEF),
                      cardChild: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Quizzes:',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
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
                              color: Colors.white,
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
                      colour1: Color(0xFF075FF3),
                      colour2: Color(0xFF13DFEF),
                      cardChild: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Last Completed Chapter:',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
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
                              color: Colors.white,
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
                      colour1: Color(0xFF075FF3),
                      colour2: Color(0xFF3B97FE),
                      cardChild: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Average Score:',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
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
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour1: Color(0xFF3B97FE),
                      colour2: Color(0xFF13DFEF),
                      cardChild: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Highest Score:',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
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
                              color: Colors.white,
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
