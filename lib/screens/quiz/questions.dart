import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String imageSrc;

  Question(this.imageSrc);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF707070),
          width: 1,
        ),
        //container radius
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      //width is double.infinity to cover the whole available space.
      width: double.infinity,

      //margin to give required formatting.
      //This will force image of any dimensions to cover the same space on the screen rather than covering different space and ruining the design.
      margin: EdgeInsets.only(left: 35, right: 35, top: 40, bottom: 40),
      child: ClipRRect(
        //image radius
        borderRadius: BorderRadius.circular(10.0),
        child: Image.asset(
          imageSrc,
        ),
      ),
    );
  }
}
