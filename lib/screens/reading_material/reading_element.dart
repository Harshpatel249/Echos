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
            color: Color(0xFFF2F5F8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 75,
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 8, left: 10, right: 10),
                  child: Container(
                    // padding: EdgeInsets.only(top: 200),
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imgSrc),
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
              color: Color(0xFFF2F5F8),
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  steps,
                  style: TextStyle(fontSize: 15),
                ),
              )),
          Divider(
            color: Colors.blue,
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
