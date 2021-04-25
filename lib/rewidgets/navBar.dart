import 'package:flutter/material.dart';
import '../screens/userProfile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/homeScreen.dart';
import '../screens/communityPage.dart';
import '../screens/difficultyPage.dart';

class NavBar extends StatelessWidget {
  NavBar({this.colour});
  Color colour;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(
                  Icons.home,
                  size: 36,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return HomeScreen();
                  }));
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.americanSignLanguageInterpreting,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, DifficultyPage.id);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.camera,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, CommunityPage.id);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.users,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return CommunityPage();
                  }));
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.solidUserCircle,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return UserProfile();
                  }));
                }),
          ),
        ],
      ),
    );
  }
}
