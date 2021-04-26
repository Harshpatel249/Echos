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
import 'screens/userProfile.dart';

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
        appBarTheme: AppBarTheme(
          color: Color(0xf006CE8),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        bottomAppBarColor: Color(0xFF006CE8),
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.black,
          ),
          bodyText2: TextStyle(
            color: Colors.black,
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
        UserProfile.id: (context) => UserProfile(),
      },
    );
  }
}
