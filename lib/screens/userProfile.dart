import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tutor/rewidgets/navBar.dart';
import '../rewidgets/longCard.dart';
import '../screens/userStatistics.dart';
class UserProfile extends StatelessWidget {
  final username = 'Zank100';
  final name = 'Sanket Shah';
  final email = 'sanket.s2@ahduin.edu.in';
  final joined = 'xx/xx/xx';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      bottomNavigationBar: NavBar(),
      body: Column(
        children: <Widget>[
          Text(
            username,
            style: TextStyle(
                fontSize: 40.0
            ),
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 20.0
            ),
          ),
          SizedBox(
            height: 20,
            width: 400,
            child: Divider(
              thickness: 2,
              color: Colors.black45,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          LongCard(
            colour: Colors.black45,
            title: 'Statistics',
            iconn: Icons.trending_up,
            press: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return UserStatistics();
                  }
              ));
            },
          ),
          SizedBox(
            height: 20,
          ),
          LongCard(
            colour: Colors.black45,
            title: 'Edit Profile',
            iconn: Icons.edit,
            press: (){},
          ),
          SizedBox(
            height: 20,
          ),
          LongCard(
            colour: Colors.black45,
            title: 'Account Settings',
            iconn: Icons.settings,
            press: (){},
          ),
          SizedBox(
            height: 20,
          ),
          LongCard(
            colour: Colors.black45,
            title: 'Log Out',
            iconn: Icons.exit_to_app,
            press: (){},
          ),
        ],
      ),
    );
  }
}


