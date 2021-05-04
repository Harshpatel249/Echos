import 'package:flutter/material.dart';
import '../difficultyPage.dart';
import './questions.dart';
import 'score_screen.dart';
import '../../rewidgets/navBar.dart';

class QuizScreen extends StatefulWidget {
  static String id = "quiz_screen";
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  final questions = const [
    {
      'imageSrc': 'assets/images/first.jpg',
      'options': ['Black', 'Red', 'Blue', 'Yellow'],
      'answer': 'Red'
    },
    {
      'imageSrc': 'assets/images/second.jpg',
      'options': ['Dog', 'Cat', 'Cow'],
      'answer': 'Dog'
    },
    {
      'imageSrc': 'assets/images/third.jpg',
      'options': ['Sandwich', 'Pizza', 'Chat', 'Paneer Sabji'],
      'answer': 'Chat'
    },
  ];

  var _queInd = 0;
  var numCorrect = 0;
  void _ansQue() {
    setState(() {
      _queInd++;
    });
    print('_queInd: $_queInd');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: _queInd < questions.length
            ? ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Q. Identify the sign',
                          style: TextStyle(
                            fontWeight: FontWeight.w400, // light
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Question(
                        questions[_queInd]['imageSrc'],
                      ),
                      ...(questions[_queInd]['options'] as List<String>)
                          .map((option) {
                        return Builder(
                          builder: (context) => optionButton(option, context),
                        );
                      }).toList()
                    ],
                  ),
                ],
              )
            : ScorePage(numCorrect, questions.length,
                (numCorrect * 100) / questions.length),
      ),
    );
  }

  Widget optionButton(String optionText, BuildContext context) {
    String result = 'Correct';
    String answer = questions[_queInd]['answer'];
    return Container(
        width: 321,
        height: 50,
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color: Color(0xFF707070), width: 1)))),
          child: Text(
            optionText,
            style: TextStyle(
              fontWeight: FontWeight.w400, // light
              fontSize: 20,
            ),
          ),
          onPressed: () {
            if (optionText == answer) {
              result = 'Correct';
              numCorrect++;
            } else
              result = 'Incorrect';
            showResult(context, result, answer);
          },
        ));
  }

  Future<void> showResult(BuildContext context, String result, String answer) {
    String btnText = _queInd + 1 < questions.length ? 'Continue' : 'Finish';
    return showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (BuildContext context) {
        // we set up a container inside which
        // we create center column and display text
        return result == 'Correct'
            ? Container(
                color: Color(0xff737373),
                child: Container(
                  decoration: new BoxDecoration(
                      color: Color(0xFFD7FFB8),
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(25.0),
                          topRight: const Radius.circular(25.0))),
                  height: 215,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 40, left: 40),
                          child: Text(
                            result + ' !',
                            style: TextStyle(
                                color: Color(0xFF5EAA02),
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Poppins',
                                fontSize: 35),
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 50, left: 40, right: 40),
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFF57CC02)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        side: BorderSide(
                                            color: Color(0xFF707070),
                                            width: 1)))),
                            child: Text(
                              btnText,
                              style: TextStyle(
                                fontWeight: FontWeight.w400, // light
                                fontSize: 20,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              _ansQue();
                            }),
                      )
                    ],
                  ),
                ),
              )
            : Container(
                color: Color(0xff737373),
                child: Container(
                  decoration: new BoxDecoration(
                      color: Color(0xFFFFDFE0),
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(25.0),
                          topRight: const Radius.circular(25.0))),
                  height: 267,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 40, left: 40),
                          child: Text(
                            'Correct Answer:',
                            style: TextStyle(
                                color: Color(0xFFEE5655),
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Poppins',
                                fontSize: 35),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 20, left: 40),
                          child: Text(
                            answer,
                            style: TextStyle(
                                color: Color(0xFFEE5655),
                                fontWeight: FontWeight.w400,
                                fontSize: 25),
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 50, left: 40, right: 40),
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFFEE5655)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        side: BorderSide(
                                            color: Color(0xFF707070),
                                            width: 1)))),
                            child: Text(
                              btnText,
                              style: TextStyle(
                                fontWeight: FontWeight.w400, // light
                                fontSize: 20,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              _ansQue();
                            }),
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }
}
