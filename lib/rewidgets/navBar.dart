import 'package:flutter/material.dart';
import '../screens/userProfile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                  FontAwesomeIcons.home,
                  size: 36,
                ),
                onPressed: () {}
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.americanSignLanguageInterpreting,
                  size: 35,
                ),
                onPressed: () {}
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.cameraRetro,
                  size: 35,
                ),
                onPressed: () {}
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                FontAwesomeIcons.solidUserCircle,
                size: 35,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return UserProfile();
                    }
                ));
              }
            ),
          ),
        ],
      ),
    );
  }
}
