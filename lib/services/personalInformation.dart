import 'package:flutter/material.dart';

class PersonalInformation extends StatelessWidget {
  static String id = 'user_profile';
  final username = 'sdfasdf'; //SignupPage.currentUser.id;
  final name = 'dadf'; //SignupPage.currentUser.name;
  final email = 'same@gmai.com'; //SignupPage.currentUser.email;
  final joined = 'xx/xx/xxxx';
  // final joined =
  //     '${SignupPage.currentUser.timestamp.day} / ${SignupPage.currentUser.timestamp.month} / ${SignupPage.currentUser.timestamp.year}';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Name:',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
          width: 320,
          child: Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'User Name:',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                username,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
          width: 320,
          child: Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Email:',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                email,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
          width: 320,
          child: Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Joined On:',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                joined,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
