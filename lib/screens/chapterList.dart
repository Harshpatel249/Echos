import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class ChapterList extends StatelessWidget {
  static String id = 'chapter_list';
  EventPhotos e = EventPhotos();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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

class EventPhotos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      // <-- Provides ExpandableController to its children
      child: Column(
        children: [
          Expandable(
            // <-- Driven by ExpandableController from ExpandableNotifier
            collapsed: ExpandableButton(
              // <-- Expands when tapped on the cover photo
              child: Text('hehe'),
            ),
            expanded: Column(children: [
              Text('hehe'),
              ExpandableButton(
                // <-- Collapses when tapped on
                child: Text("Back"),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
