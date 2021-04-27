import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../rewidgets/navBar.dart';
import 'chapterList.dart';

class DifficultyPage extends StatefulWidget {
  static String id = 'difficulty_page';
  @override
  _DifficultyPageState createState() => _DifficultyPageState();
}

class _DifficultyPageState extends State<DifficultyPage> {
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
            'ASL Lessons',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: NavBar(id: DifficultyPage.id),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Choose Lesson difficulty',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  print('Easy difficulty');
                  Navigator.pushNamed(context, ChapterList.id);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage('images/easy.gif'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  print('Intermediate difficulty');
                  Navigator.pushNamed(context, ChapterList.id);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage('images/easy.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  print('Expert difficulty');
                  Navigator.pushNamed(context, ChapterList.id);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage('images/easy.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
