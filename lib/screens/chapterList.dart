import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class ChapterList extends StatelessWidget {
  static String id = 'chapter_list';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ashvat'),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Row(
            children: [
              Icon(Icons.menu),
            ],
          ),
        ),
        body: ListView(
          children: [
            ExpandableTheme(
              data: ExpandableThemeData(
                iconColor: Colors.white,
                iconPadding: EdgeInsets.only(top: 10, right: 20),
              ),
              child: ExpandablePanel(
                header: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Chapter 1',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                collapsed: null,
                expanded: Text('Expanded'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
