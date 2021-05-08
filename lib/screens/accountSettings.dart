import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tutor/rewidgets/navBar.dart';
import '../screens/changePassword.dart';
import '../screens/userProfile.dart';
import 'personalInformation.dart';

class AccountSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AlertDialog dialog = AlertDialog(
      title: Text('Reset settings?'),
      content:
          Text('This will reset your account to its default factory settings. '
              ' All of your progress including your quiz scores will be lost. '
              ' Are you sure you want to continue?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('CANCEL'),
        ),
        TextButton(
          onPressed: () async {
            final chaptersRef =
                await FirebaseFirestore.instance.collection('chapters').get();

            chaptersRef.docs.forEach((chapDoc) async {
              final chapUsersRef = await FirebaseFirestore.instance
                  .collection('chapters')
                  .doc(chapDoc.id)
                  .collection('users')
                  .get();

              chapUsersRef.docs.forEach((userDoc) {
                FirebaseFirestore.instance
                    .collection('chapters')
                    .doc(chapDoc.id)
                    .collection('users')
                    .doc(NavBar.currentUser.id)
                    .delete();
              });
            });
            final usersRef =
                await FirebaseFirestore.instance.collection('users').get();
            usersRef.docs.forEach((doc) async {
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(NavBar.currentUser.id)
                  .collection('quizzes')
                  .get()
                  .then((snapshot) {
                for (DocumentSnapshot ds in snapshot.docs) {
                  ds.reference.delete();
                }
              });
            });
            FirebaseFirestore.instance
                .collection('users')
                .doc(NavBar.currentUser.id)
                .update({
              "lastChapId": 'No Attempts',
            });

            Navigator.pop(context);
          },
          child: Text('CONTINUE'),
        ),
      ],
    );
    final SimpleDialog ChangePass = SimpleDialog(
      title: Text('Change Password'),
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ChangePassword(),
        ),
      ],
    );
    final SimpleDialog PersonalInfo = SimpleDialog(
        title: Center(child: Text('Personal Information')),
        children: [
          PersonalInformation(),
        ]);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'Account Settings',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: NavBar(
          id: UserProfile.id,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: 'logo',
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/images/ECHOS2.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            LongCard2(
              colour: Color(0xFF075FF3),
              title: 'Personal Information',
              iconn: Icons.person,
              press: () {
                showDialog<void>(
                    context: context, builder: (context) => PersonalInfo);
              },
            ),
            SizedBox(
              height: 20,
            ),
            LongCard2(
              colour: Color(0xFF075FF3),
              title: 'Change Password',
              iconn: Icons.lock,
              press: () {
                showDialog<void>(
                    context: context, builder: (context) => ChangePass);
              },
            ),
            SizedBox(
              height: 20,
            ),
            LongCard2(
              colour: Color(0xFF075FF3),
              title: 'Reset All Progress',
              iconn: Icons.restore,
              press: () {
                showDialog<void>(
                    context: context, builder: (context) => dialog);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LongCard2 extends StatelessWidget {
  LongCard2({this.colour, this.iconn, this.title, this.press});

  Color colour;
  IconData iconn;
  final title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: colour,
          ),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 60.0,
              ),
              Icon(
                iconn,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          onPressed: press,
        ),
      ),
    );
  }
}
