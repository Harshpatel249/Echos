import 'package:flutter/material.dart';

class LongCard extends StatelessWidget {
  LongCard({this.colour1, this.colour2, this.iconn, this.title, this.press});

  Color colour1, colour2;
  IconData iconn;
  final title;
  final VoidCallback press;

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
      child: TextButton(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              Icon(
                iconn,
                size: 80,
                color: Colors.white,
              ),
              SizedBox(
                height: 20.0,
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        onPressed: press,
      ),
    );
  }
}
