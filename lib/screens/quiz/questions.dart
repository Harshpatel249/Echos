import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String imageSrc;

  Question(this.imageSrc);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageSrc),
              fit: BoxFit.fill,
            ),
            border: Border.all(
              color: Color(0xFF707070),
              width: 1,
            ),
            //container radius
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
