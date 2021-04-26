import 'package:flutter/material.dart';
import '../rewidgets/navBar.dart';
import 'loginPage.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home_page';
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
            'Home',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: NavBar(
          id: HomeScreen.id,
        ),
        body: Column(
          children: <Widget>[
            Text(
              'Welcome to Echoes',
              style: TextStyle(
                fontSize: 40.0,
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginPage.id);
                },
                child: Image.asset('images/Tutorial.png'),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: Image.asset('images/LogoEchoes.png'),
              ),
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
