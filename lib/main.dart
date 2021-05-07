import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sign_language_tutor/screens/difficultyPage.dart';
import 'screens/aslDetection.dart';
import 'screens/chapterList.dart';
import 'screens/communityPage.dart';
import 'screens/difficultyPage.dart';
import 'screens/homeScreen.dart';
import 'screens/loginPage.dart';
import 'screens/signupPage.dart';
import 'screens/testScreen.dart';
import 'screens/userProfile.dart';
import 'screens/viewPost.dart';
import 'screens/reading_material/reading_material_screen.dart';
import 'screens/quiz/quiz_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

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
        scaffoldBackgroundColor: Color(0xFFF2F5F8),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.black,
            fontFamily: 'Ubuntu',
          ),
          bodyText2: TextStyle(
            color: Colors.black,
            fontFamily: 'Ubuntu',
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
        ASLDetection.id: (context) => ASLDetection(),
        ReadingMaterialScreen.id: (context) => ReadingMaterialScreen(),
        QuizScreen.id: (context) => QuizScreen(),
      },
    );
  }
}
