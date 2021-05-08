import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tutor/rewidgets/navBar.dart';

class PersonalInformation extends StatefulWidget {
  static String id = 'user_profile';
  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final usersRef = FirebaseFirestore.instance.collection('users');

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
      setState(() {
        fetched = true;
      });
      print(joined);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJoinedDate();
  }

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
