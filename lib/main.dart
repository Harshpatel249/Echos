import 'package:flutter/material.dart';
import 'screens/testScreen.dart';

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
        backgroundColor: Color(0xFF1D3557),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Color(0xFFF1FAEE),
          ),
        ),
      ),
      initialRoute: TestScreen.id,
      routes: {TestScreen.id: (context) => TestScreen()},
    );
  }
}
