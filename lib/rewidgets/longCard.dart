import 'package:flutter/material.dart';

class LongCard extends StatelessWidget {
  LongCard({
    this.colour,
    this.iconn,
    this.title,
    this.press
  });

  Color colour;
  IconData iconn;
  final title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: colour,

        ),
        child: Row(
          children: <Widget>[
            Icon(
              iconn,
              size: 35,
              color: Colors.white,
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
            ),
          ],
        ),
        onPressed: press,
      ),
    );
  }
}