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

  // Future<List<ChapterContainer>> getChapter() async {
  //   QuerySnapshot snapshot =
  //       await ;
  //   // List<Future<ChapterContainer>> chapters =
  //
  //   return snapshot.docs.map((doc) async {
  //     return (ChapterContainer(
  //       chaptersQuiz: await chaptersRef.doc(doc.id).collection('quiz').get(),
  //       readingCollection:
  //           await chaptersRef.doc(doc.id).collection('reading').get(),
  //       doc: doc,
  //     ));
  //     // chapters.add(ChapterContainer.fromDocument(chaptersQuiz));
  //   }).toList();
  //   print('##########################');
  //   // print(chapters);
  // }

  buildChapters() {
    return FutureBuilder<QuerySnapshot>(
      future: chaptersRef.where("difficulty", isEqualTo: difficulty).get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          print('snapshot empty in chaptersRef');
          return circularProgress();
        }
        List<ChapterContainer> chapters = [];
        snapshot.data.docs.forEach((doc) {
          chapters.add(ChapterContainer.fromDocument(doc, chaptersRef));
        });

        return ListView(
          children: chapters,
        );
      },
    );
    // final QuerySnapshot chapterSnapShot =
    //     await chaptersRef.where("difficulty", isEqualTo: difficulty).get();
    // chapterSnapShot.docs.forEach((doc) async {
    //   chaptersQuiz = await chaptersRef.doc(doc.id).collection('quiz').get();
    // });
    // chaptersQuiz.docs.forEach((doc) {
    //   print(doc.data());
    // });

    // return FutureBuilder<QuerySnapshot>(
    //   future: chaptersRef.doc(difficulty).collection('chapters').get(),
    //   builder: (context, snapshot) {
    //     if (!snapshot.hasData) {
    //       print('snapshot empty');
    //       return circularProgress();
    //     }
    //     snapshot.data.docs.forEach((doc) {
    //       print();
    //     });
    //     List<ChapterContainer> chapters = [];
    //     snapshot.data.docs.forEach((doc) {
    //       chapters.add(ChapterContainer.fromDocument(doc));
    //     });
    //     return ListView(
    //       children: chapters,
    //     );
    //   },
    // );
  }

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
        body: Column(
          children: [
            Expanded(
              child: buildChapters(),
              // ListView(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: ChapterContainer(),
              //     ),
              //   ],
              // ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
