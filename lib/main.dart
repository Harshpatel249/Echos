import 'package:flutter/material.dart';
import 'screens/testScreen.dart';
import 'screens/communityPage.dart';
import 'screens/viewPost.dart';
import 'screens/homeScreen.dart';

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
        scaffoldBackgroundColor: Color(0xFFf7f3e9),
        bottomAppBarColor: Color(0xFFf05945),
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
      },
    );
  }
}
