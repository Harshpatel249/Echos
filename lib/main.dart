import 'package:flutter/material.dart';
import 'screens/testScreen.dart';
import 'screens/communityPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF1D3557),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Color(0xFFF1FAEE),
          ),
        ),
      ),
      initialRoute: CommunityPage.id,
      routes: {
        TestScreen.id: (context) => TestScreen(),
        CommunityPage.id: (context) => CommunityPage(),
      },
    );
  }
}
