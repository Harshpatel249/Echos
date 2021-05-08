import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tutor/rewidgets/navBar.dart';

import '../rewidgets/reusableCard.dart';
import 'userProfile.dart';

class UserStatistics extends StatefulWidget {
  @override
  _UserStatisticsState createState() => _UserStatisticsState();
}

class _UserStatisticsState extends State<UserStatistics> {
  final usersRef = FirebaseFirestore.instance.collection('users');
  Color starting = Color(0xFF3B97FE);
  Color ending = Color(0xFF13DFEF);

  DateTime joined;
  int quizNum;
  String lastChapter;
  int quizAvg;
  int quizMax = 0;
  bool fetched = false;

  getStatistics() async {
    print(
        '----------------------- inside the getLastChapter-----------------------');
    var userSnapshot = await usersRef.doc(NavBar.currentUser.id).get();
    var quizSnapshot =
        await usersRef.doc(NavBar.currentUser.id).collection('quizzes').get();

    lastChapter = userSnapshot['lastChapId'];

    Timestamp timestamp = userSnapshot['joining_date'];
    print(userSnapshot['joining_date']);
    joined = timestamp.toDate();
    // print('${joined.day}/${joined.month}/${joined.year}');
    // print(joined.toString());
    print(userSnapshot['name']);
    print(userSnapshot['lastChapId']);

    quizNum = quizSnapshot.docs.length;
    double sum = 0.0;
    quizSnapshot.docs.forEach((doc) {
      sum = sum + doc['score'];
      int score = (doc['score']).toInt();
      quizAvg = (sum / quizNum).toInt();
      if (score > quizMax) {
        quizMax = score;
      }
    });
    if (quizAvg == null) {
      quizAvg = 0;
    }
    print(sum);
    print(quizAvg);
    print(quizMax);
    setState(() {
      fetched = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStatistics();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                            fetched
                                ? '${joined.day}/${joined.month}/${joined.year}'
                                : '0',
                            style: TextStyle(
                              fontSize: 35.0,
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
                            fetched ? lastChapter : 'No Attempts',
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
                            fetched ? '$quizAvg%' : 'No Attempts',
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
                            fetched ? '$quizMax%' : 'No Attempts',
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

// class UserStatistics extends StatefulWidget {
//   @override
//   _UserStatistics createState() => _UserStatistics();
// }
//
// class _UserStatistics extends State<UserStatistics> {
//
//
//   @override
//   _UserStatistics createState() => _UserStatistics();
//
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Statistics',
//             style: TextStyle(color: Colors.black),
//           ),
//           centerTitle: true,
//         ),
//         bottomNavigationBar: NavBar(
//           id: UserProfile.id,
//         ),
//         body: Column(
//           children: <Widget>[
//             Expanded(
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: ReusableCard(
//                       colour1: Color(0xFF075FF3),
//                       colour2: Color(0xFF3B97FE),
//                       cardChild: Column(
//                         children: <Widget>[
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             'Joined On:',
//                             style: TextStyle(
//                               fontSize: 20.0,
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                             width: 150,
//                             child: Divider(
//                               thickness: 1,
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text(
//                             joined,
//                             style: TextStyle(
//                               fontSize: 40.0,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: ReusableCard(
//                       colour1: Color(0xFF3B97FE),
//                       colour2: Color(0xFF13DFEF),
//                       cardChild: Column(
//                         children: <Widget>[
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             'Quizzes:',
//                             style: TextStyle(
//                               fontSize: 20.0,
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                             width: 150,
//                             child: Divider(
//                               thickness: 1,
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text(
//                             quizNum.toString(),
//                             style: TextStyle(
//                               fontSize: 50.0,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: ReusableCard(
//                       colour1: Color(0xFF075FF3),
//                       colour2: Color(0xFF13DFEF),
//                       cardChild: Column(
//                         children: <Widget>[
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             'Last Completed Chapter:',
//                             style: TextStyle(
//                               fontSize: 20.0,
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                             width: 300,
//                             child: Divider(
//                               thickness: 1,
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text(
//                             lastChapter,
//                             style: TextStyle(
//                               fontSize: 40.0,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: ReusableCard(
//                       colour1: Color(0xFF075FF3),
//                       colour2: Color(0xFF3B97FE),
//                       cardChild: Column(
//                         children: <Widget>[
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             'Average Score:',
//                             style: TextStyle(
//                               fontSize: 20.0,
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                             width: 150,
//                             child: Divider(
//                               thickness: 1,
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text(
//                             '$quizAvg',
//                             style: TextStyle(
//                               fontSize: 50.0,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: ReusableCard(
//                       colour1: Color(0xFF3B97FE),
//                       colour2: Color(0xFF13DFEF),
//                       cardChild: Column(
//                         children: <Widget>[
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             'Highest Score:',
//                             style: TextStyle(
//                               fontSize: 20.0,
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                             width: 150,
//                             child: Divider(
//                               thickness: 1,
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text(
//                             '$quizMax',
//                             style: TextStyle(
//                               fontSize: 50.0,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         // ),
//       ),
//     );
//   }
// }
