import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class ChapterContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black45,
        border: Border.all(color: Colors.blueAccent),
      ),
      child: ExpandableTheme(
        data: ExpandableThemeData(
          iconColor: Colors.white,
          iconPadding: EdgeInsets.only(top: 10, right: 10, left: 10),
        ),
        child: ExpandablePanel(
          header: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  'Chapter 1',
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(flex: 1),
                SizedBox(
                  height: 4,
                  width: 40,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                  height: 4,
                  width: 40,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                  height: 4,
                  width: 40,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          collapsed: null,
          expanded: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    print('Clicked on video');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black45,
                      border: Border.all(color: Colors.green),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Video',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    print('Clicked on Reading');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black45,
                      border: Border.all(color: Colors.white),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text('Reading Material'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    print('Clicked on Quiz');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black45,
                      border: Border.all(color: Colors.white),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text('Quiz'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
