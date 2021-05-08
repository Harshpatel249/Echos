import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tutor/rewidgets/navBar.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ScorePage extends StatefulWidget {
  static String id = 'score_screen';
  final int marks;
  final int totalQuestions;
  final double marksPercentage;
  DocumentSnapshot doc;
  CollectionReference chaptersRef;
  ScorePage(this.marks, this.totalQuestions, this.marksPercentage, this.doc,
      this.chaptersRef);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScorePageState(
      marks: marks,
      totalQuestions: totalQuestions,
      marksPercentage: marksPercentage,
    );
  }
}

class _ScorePageState extends State<ScorePage> {
  int marks;
  int totalQuestions;
  double marksPercentage;
  Timer _timer;
  double progressValue = 0;
  double secondaryProgressValue = 0;
  final usersRef = FirebaseFirestore.instance.collection('users');

  // DocumentSnapshot doc;
  // CollectionReference chaptersRef;
  // ignore: sort_constructors_first
  _ScorePageState({
    this.marks,
    this.totalQuestions,
    this.marksPercentage,
    // this.doc,
    // this.chaptersRef,
  }) {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (Timer _timer) {
      setState(() {
        // secondaryProgressValue = secondaryProgressValue + 2;
        if (progressValue >= marksPercentage) {
          _timer.cancel();
        }
        progressValue++;
        // if (secondaryProgressValue > marksPercentage) {
        //   secondaryProgressValue = marksPercentage.toDouble();
        // }
      });
    });
  }
  String getLastChapter() {
    return 'Chapter ${widget.doc['chapNum']} (${widget.doc['difficulty']})';
  }

  @override
  Widget build(BuildContext context) {
    // return Text('hello ');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 350,
          width: 350,
          child: SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
                minimum: 0,
                maximum: 100,
                showLabels: false,
                showTicks: false,
                startAngle: 270,
                endAngle: 270,
                radiusFactor: 0.8,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.05,
                  color: const Color.fromARGB(30, 0, 169, 181),
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                      value: progressValue,
                      width: 0.05,
                      sizeUnit: GaugeSizeUnit.factor,
                      enableAnimation: true,
                      animationDuration: 100,
                      animationType: AnimationType.linear)
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    positionFactor: 0,
                    widget: Text(
                      marksPercentage.toStringAsFixed(0) + '%',
                      style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ])
          ]),
        ),
        Center(
          child: Text('Score: $marks/$totalQuestions',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
            child: Container(
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color: Color(0xFF707070), width: 1),
                    ),
                  ),
                ),
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(NavBar.currentUser.id)
                      .update({
                    "lastChapId": getLastChapter(),
                  });

                  usersRef
                      .doc(NavBar.currentUser.id)
                      .collection('quizzes')
                      .doc(widget.doc.id)
                      .set({
                    "score": marksPercentage,
                  });
                  Navigator.pop(context);
                },
                child: Text('Finish',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
