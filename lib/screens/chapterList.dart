import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../rewidgets/chapterContainer.dart';
import '../rewidgets/navBar.dart';
import 'difficultyPage.dart';

class ChapterList extends StatelessWidget {
  static String id = 'chapter_list';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // child: Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: Alignment.bottomLeft,
      //         end: Alignment.topRight,
      //         colors: [Colors.black, Colors.blue]),
      //   ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Echoes',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: NavBar(id: DifficultyPage.id),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChapterContainer(),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
