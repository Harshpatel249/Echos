import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_language_tutor/models/userModel.dart';
import 'package:sign_language_tutor/screens/userProfile.dart';

import '../screens/aslDetection.dart';
import '../screens/communityPage.dart';
import '../screens/difficultyPage.dart';
import '../screens/homeScreen.dart';
import '../screens/loginPage.dart';

class NavBar extends StatefulWidget {
  NavBar({@required this.id});
  String id;
  static UserModel currentUser;
  static final postsRef = FirebaseFirestore.instance.collection('posts');
  @override
  _NavBarState createState() => _NavBarState(id: this.id);
}

class _NavBarState extends State<NavBar> {
  String id;
  _NavBarState({this.id});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final usersRef = FirebaseFirestore.instance.collection('users');
  bool loggedIn = false;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        DocumentSnapshot doc = await usersRef.doc(_auth.currentUser.uid).get();
        setState(() {
          loggedIn = true;
        });
        if (doc.exists) {
          print('-------------------NavBar-------------');
          print('Document Fetched in NavBar ');
          NavBar.currentUser = UserModel.fromDocument(doc);
          print('---------------instance of the NavBar -------------');
          print(NavBar.currentUser.id);

          print('login successful');

          // await _auth.currentUser
          //     .updateProfile(displayName: LoginPage.currentUser.name);

        } else {
          setState(() {
            loggedIn = false;
          });
        }
      } else {
        setState(() {
          loggedIn = false;
        });
      }
    });
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    checkAuthentication();
    print('navbar init called');
  }

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
                  Icons.menu_book,
                  //FontAwesomeIcons.americanSignLanguageInterpreting,
                  size: 35,
                  color: this.id == DifficultyPage.id
                      ? Colors.white
                      : Color(0xFFC3C2C3),
                ),
                onPressed: () {
                  loggedIn
                      ? Navigator.pushNamedAndRemoveUntil(
                          context, DifficultyPage.id, (route) => false)
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage(
                                    routeTo: DifficultyPage.id,
                                  )));
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
                  loggedIn
                      ? Navigator.pushNamedAndRemoveUntil(
                          context, CommunityPage.id, (route) => false)
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage(
                                    routeTo: CommunityPage.id,
                                  )));
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
                  loggedIn
                      ? Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => UserProfile(auth: _auth)), (route) => false)
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage(
                                    routeTo: UserProfile.id,
                                  )));
                }),
          ),
        ],
      ),
    );
  }
}

// class NavBar extends StatelessWidget {
//   NavBar({@required this.id});
//   String id;
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: IconButton(
//               icon: Icon(
//                 Icons.home,
//                 size: 36,
//                 color:
//                     this.id == HomeScreen.id ? Colors.white : Color(0xFFC3C2C3),
//               ),
//               onPressed: () {
//                 Navigator.pushNamedAndRemoveUntil(
//                     context, HomeScreen.id, (route) => false);
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: IconButton(
//                 icon: Icon(
//                   FontAwesomeIcons.americanSignLanguageInterpreting,
//                   size: 35,
//                   color: this.id == DifficultyPage.id
//                       ? Colors.white
//                       : Color(0xFFC3C2C3),
//                 ),
//                 onPressed: () {
//                   Navigator.pushNamedAndRemoveUntil(
//                       context, LoginPage.id, (route) => false);
//                 }),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: IconButton(
//                 icon: Icon(
//                   Icons.camera_alt,
//                   size: 35,
//                   color: this.id == ASLDetection.id
//                       ? Colors.white
//                       : Color(0xFFC3C2C3),
//                 ),
//                 onPressed: () {
//                   Navigator.pushNamedAndRemoveUntil(
//                       context, ASLDetection.id, (route) => false);
//                 }),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: IconButton(
//                 icon: Icon(
//                   Icons.group,
//                   size: 35,
//                   color: this.id == CommunityPage.id
//                       ? Colors.white
//                       : Color(0xFFC3C2C3),
//                 ),
//                 onPressed: () {
//                   Navigator.pushNamedAndRemoveUntil(
//                       context, CommunityPage.id, (route) => false);
//                 }),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: IconButton(
//                 icon: Icon(
//                   Icons.account_circle,
//                   size: 35,
//                   color: this.id == UserProfile.id
//                       ? Colors.white
//                       : Color(0xFFC3C2C3),
//                 ),
//                 onPressed: () {
//                   Navigator.pushNamedAndRemoveUntil(
//                       context, UserProfile.id, (route) => false);
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }
