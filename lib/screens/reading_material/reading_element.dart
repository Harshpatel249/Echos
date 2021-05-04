import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadingElement extends StatelessWidget {
  final String title;
  final String steps;
  final String imgSrc;

  ReadingElement(this.title, this.steps, this.imgSrc);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            color: Colors.red,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 8.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 100,
                        backgroundColor: Colors.blue,
                        color: Colors.green,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.yellow),
                  ),
                ),
                SizedBox(
                  width: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 8),
                  child: Container(
                    // padding: EdgeInsets.only(top: 200),
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imgSrc),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
              color: Colors.pink,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  steps,
                  style: TextStyle(fontSize: 25),
                ),
              )),
          Divider(
            color: Colors.orange,
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}
