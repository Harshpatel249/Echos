import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tutor/rewidgets/chapterContainer.dart';
import 'package:sign_language_tutor/rewidgets/progress.dart';

import '../rewidgets/navBar.dart';
import 'difficultyPage.dart';

class ChapterList extends StatelessWidget {
  static String id = 'chapter_list';
  final chaptersRef = FirebaseFirestore.instance.collection('chapters');
  String difficulty;
  ChapterList({this.difficulty});
  QuerySnapshot chaptersQuiz;
  QuerySnapshot readingCollection;

  buildChapters() {
    print('==============================================================');
    print(difficulty);

    return FutureBuilder<QuerySnapshot>(
      future: chaptersRef.where("difficulty", isEqualTo: difficulty).get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          print('snapshot empty in chaptersRef');
          return circularProgress();
        }
        List<ChapterContainer> chapters = [];
        // snapshot.data.docs.sort();
        snapshot.data.docs.forEach((doc) {
          chapters.add(ChapterContainer.fromDocument(doc, chaptersRef));
        });
        // print('########################');
        chapters.sort((a, b) {
          return a.chapNum.compareTo(b.chapNum);
        });
        // print(chapters);
        return ListView(
          children: chapters,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Echoes',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: NavBar(id: DifficultyPage.id),
        body: Column(
          children: [
            Expanded(
              child: buildChapters(),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
