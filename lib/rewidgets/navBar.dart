import 'package:flutter/material.dart';
import '../screens/userProfile.dart';

class NavBar extends StatelessWidget {
  NavBar({this.colour});
  Color colour;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          Spacer(),
          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return UserProfile();
                }));
              }),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
    );
  }
}
