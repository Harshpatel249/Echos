import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/aslDetection.dart';
import '../screens/communityPage.dart';
import '../screens/difficultyPage.dart';
import '../screens/homeScreen.dart';
import '../screens/userProfile.dart';

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
                  Icons.camera_alt,
                  size: 35,
                  color: this.id == ASLDetection.id
                      ? Colors.white
                      : Color(0xFFC3C2C3),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, ASLDetection.id, (route) => false);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(
                  Icons.group,
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
                  Icons.account_circle,
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
