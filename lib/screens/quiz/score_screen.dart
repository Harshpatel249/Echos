import 'package:flutter/material.dart';
import 'package:sign_language_tutor/screens/chapterList.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:sign_language_tutor/main.dart';
import 'dart:async';

class ScorePage extends StatefulWidget {
  final int marks;
  final int totalQuestions;
  final double marksPercentage;
  ScorePage(this.marks, this.totalQuestions, this.marksPercentage);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScorePageState(marks, totalQuestions, marksPercentage);
  }
}

class _ScorePageState extends State<ScorePage> {
  int marks;
  int totalQuestions;
  double marksPercentage;
  Timer _timer;
  double progressValue = 0;
  double secondaryProgressValue = 0;
  // ignore: sort_constructors_first
  _ScorePageState(this.marks, this.totalQuestions, this.marksPercentage) {
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: 120,
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
                      widget: Text(marksPercentage.toStringAsFixed(0) + '%'))
                ])
          ]),
        ),
        Center(
          child: Text('Score: $marks/$totalQuestions',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
        ),
        Center(
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ChapterList()));
            },
            child: Text('GO again Chapter list',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      ],
    );
  }
}
