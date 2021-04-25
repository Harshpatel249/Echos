import 'package:flutter/material.dart';
import '../rewidgets/navBar.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home_page';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      bottomNavigationBar: NavBar(),
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
              onPressed: (){},
              child: Image.asset('images/Tutorial.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: (){},
              child: Image.asset('images/LogoEchoes.png'),
            ),
          ),
        ],
      ),
    );
  }
}
