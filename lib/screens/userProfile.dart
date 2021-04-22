import 'package:flutter/material.dart';
import 'package:sign_language_tutor/rewidgets/navBar.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      bottomNavigationBar: NavBar(),
      body: Column(
        children: <Widget>[
          Container(
            color: Color(0xFF1D1E33),
            margin: EdgeInsets.all(15.0),
            height: 160,
            width: 200,
          ),
        ],
      ),
    );
  }
}
