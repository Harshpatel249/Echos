import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_language_tutor/rewidgets/navBar.dart';

import '../rewidgets/longCard.dart';
import '../screens/accountSettings.dart';
import '../screens/editProfile.dart';
import '../screens/homeScreen.dart';
import '../screens/userStatistics.dart';
import 'homeScreen.dart';

class UserProfile extends StatelessWidget {
  static String id = 'user_profile';
  final FirebaseAuth auth;
  UserProfile({this.auth});
  final username = NavBar.currentUser.username;
  final name = NavBar.currentUser.name;
  final email = NavBar.currentUser.email;

  final joined = 'xx/xx/xxxx';

  @override
  Widget build(BuildContext context) {
    final AlertDialog logout = AlertDialog(
      title: Text('Log Out'),
      content: Text('You will be logged out of your account.'
          ' Are you sure you want to continue?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            print('logout called');
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.id, (route) => false);
            print('continue pressed');
          },
          child: Text('CONTINUE'),
        ),
      ],
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          username,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: NavBar(
        id: UserProfile.id,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              name,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 18.0, right: 12.0, left: 8.0, bottom: 12.0),
                    child: LongCard(
                      colour1: Color(0xFF075FF3),
                      colour2: Color(0xFF3B97FE),
                      title: 'Statistics',
                      iconn: Icons.trending_up,
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    UserStatistics()));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 18.0, right: 8.0, left: 12.0, bottom: 12.0),
                    child: LongCard(
                      colour1: Color(0xFF3B97FE),
                      colour2: Color(0xFF13DFEF),
                      title: 'Edit Profile',
                      iconn: Icons.edit,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                EditProfile(auth: this.auth),
                            fullscreenDialog: true,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, right: 12.0, left: 8.0, bottom: 18.0),
                    child: LongCard(
                      colour1: Color(0xFF075FF3),
                      colour2: Color(0xFF3B97FE),
                      title: 'Account',
                      iconn: FontAwesomeIcons.userCog,
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AccountSettings()));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, right: 8.0, left: 12.0, bottom: 18.0),
                    child: LongCard(
                      colour1: Color(0xFF3B97FE),
                      colour2: Color(0xFF13DFEF),
                      title: 'Log Out',
                      iconn: FontAwesomeIcons.doorOpen,
                      press: () {
                        showDialog<void>(
                            context: context, builder: (context) => logout);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        // ),
      ),
    );
  }
}
