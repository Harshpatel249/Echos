import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../rewidgets/navBar.dart';
import 'chapterList.dart';
import 'loginPage.dart';

class DifficultyPage extends StatefulWidget {
  static String id = 'difficulty_page';
  @override
  _DifficultyPageState createState() => _DifficultyPageState();
}

class _DifficultyPageState extends State<DifficultyPage> {
  ////////////////////////////////////////////////////////////////
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isLoggedIn = false;
  String difficulty;
  checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        print('user is null');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }

  getUser() async {
    User firebseUser = _auth.currentUser;
    await firebseUser?.reload(); //  reloading the user which we just grabbed
    firebseUser = _auth.currentUser;
    //after reloading we have to again grab the user
    if (firebseUser != null) {
      setState(() {
        print('user is not null');
        this.user = firebseUser;
        this.isLoggedIn = true;
      });
    } else {
      print('user is null');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.checkAuthentication();
    this.getUser();
  }

  ////////////////////////////////////////////////////////////////
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
                  this.difficulty = 'easy';
                  print('Easy difficulty');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChapterList(
                                difficulty: this.difficulty,
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://media1.tenor.com/images/12432b94d86a8b480d0d51a768e63988/tenor.gif?itemid=21471184'),
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
                  this.difficulty = 'medium';
                  print('Intermediate difficulty');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        print(
                            '***********************************************************');
                        print(this.difficulty);
                        return ChapterList(
                          difficulty: this.difficulty,
                        );
                      },
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://media1.tenor.com/images/88a16a6b62c98b6021ca3fbe579ed1fe/tenor.gif?itemid=21471185'),
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
                  this.difficulty = 'hard';
                  print('Expert difficulty');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        print(
                            '***********************************************************');
                        print(this.difficulty);
                        return ChapterList(
                          difficulty: this.difficulty,
                        );
                      },
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://media1.tenor.com/images/d8b3c1411c6b34d838aa612f5fd4814d/tenor.gif?itemid=21468221'),
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
