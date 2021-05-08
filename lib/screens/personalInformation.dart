import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tutor/rewidgets/navBar.dart';

class PersonalInformation extends StatelessWidget {
  final usersRef = FirebaseFirestore.instance.collection('users');
  static String id = 'user_profile';
  final username = NavBar.currentUser.username;
  final name = NavBar.currentUser.name;
  final email = NavBar.currentUser.email;
  String joined;
  bool fetched = false;
  // final joined =
  //     '${SignupPage.currentUser.timestamp.day} / ${SignupPage.currentUser.timestamp.month} / ${SignupPage.currentUser.timestamp.year}';
  getJoinedDate() {
    usersRef
        .doc(NavBar.currentUser.id)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      Timestamp timestamp = documentSnapshot['joining_date'];
      DateTime d = timestamp.toDate();
      joined = '${d.day}/${d.month}/${d.year}';
      fetched = true;
      print(joined);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(
        '------------------------------------- inside the build function before calling get JoinedData() ---------------------------------------');
    getJoinedDate();
    print(
        '------------------------------------- inside the build function after calling get JoinedData() ---------------------------------------');
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
                fetched ? joined : 'loading',
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
