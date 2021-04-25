import 'package:flutter/material.dart';
import 'package:sign_language_tutor/screens/difficultyPage.dart';
import 'screens/testScreen.dart';
import 'screens/communityPage.dart';
import 'screens/viewPost.dart';
import 'screens/homeScreen.dart';
import 'screens/difficultyPage.dart';
import 'screens/chapterList.dart';
import 'screens/loginPage.dart';
import 'screens/signupPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        bottomAppBarColor: Color(0xFFf05945),
        scaffoldBackgroundColor: Colors.transparent,

        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Color(0xFF5eaaa8),
          ),
        ),
      ),

      initialRoute: HomeScreen.id,


      routes: {
        TestScreen.id: (context) => TestScreen(),
        CommunityPage.id: (context) => CommunityPage(),
        ViewPost.id: (context) => ViewPost(),
        HomeScreen.id: (context) => HomeScreen(),
        DifficultyPage.id: (context) => DifficultyPage(),
        ChapterList.id: (context) => ChapterList(),
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
      },
    );
  }
}
