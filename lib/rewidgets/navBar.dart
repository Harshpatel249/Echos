import 'package:flutter/material.dart';
import '../screens/userProfile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/homeScreen.dart';
import '../screens/communityPage.dart';
import '../screens/difficultyPage.dart';

class NavBar extends StatelessWidget {
  NavBar({@required this.id});
  String id;

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
                color:
                    this.id == HomeScreen.id ? Colors.white : Color(0xFFC3C2C3),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, HomeScreen.id, (route) => false);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.americanSignLanguageInterpreting,
                  size: 35,
                  color: this.id == DifficultyPage.id
                      ? Colors.white
                      : Color(0xFFC3C2C3),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, DifficultyPage.id, (route) => false);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.camera,
                  size: 35,
                  color: this.id == CommunityPage.id
                      ? Colors.white
                      : Color(0xFFC3C2C3),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, CommunityPage.id, (route) => false);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.users,
                  size: 35,
                  color: this.id == CommunityPage.id
                      ? Colors.white
                      : Color(0xFFC3C2C3),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, CommunityPage.id, (route) => false);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.solidUserCircle,
                  size: 35,
                  color: this.id == UserProfile.id
                      ? Colors.white
                      : Color(0xFFC3C2C3),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, UserProfile.id, (route) => false);
                }),
          ),
        ],
      ),
    );
  }
}
