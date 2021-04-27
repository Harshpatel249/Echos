import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({@required this.colour1, this.colour2, this.cardChild});

  final Color colour1, colour2;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [colour1, colour2],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ],
      ),
      child: cardChild,
      margin: EdgeInsets.all(15.0),
    );
  }
}
//0xFF3B97FE
//0xFF13DFEF