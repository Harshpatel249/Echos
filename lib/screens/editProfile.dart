import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tutor/models/userModel.dart';
import 'package:sign_language_tutor/rewidgets/navBar.dart';
import 'package:sign_language_tutor/rewidgets/progress.dart';

class EditProfile extends StatefulWidget {
  final FirebaseAuth auth;
  EditProfile({this.auth});

  @override
  _EditProfileState createState() => _EditProfileState(auth:this.auth);
}

class _EditProfileState extends State<EditProfile> {
  final FirebaseAuth auth;
  _EditProfileState({this.auth});
  final usersRef = FirebaseFirestore.instance.collection('users');
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  UserModel user;
  bool _nameValid = true;
  bool _usernameValid = true;
  bool _emailValid = true;
  User firebaseUser;

  getUser() async {
    setState(() {
      isLoading = true;
    });
    DocumentSnapshot doc = await usersRef
        .doc(NavBar.currentUser.id)
        .get(); //change widget.currentUserId to NavBar.currentUser.Id
    user = UserModel.fromDocument(doc);
    // print("name: ${user.name}");
    // print("username: ${user.username}");
    nameController.text = user.name;
    userNameController.text = user.username;
    emailController.text = user.email;

    setState(() {
      isLoading = false;
    });
  }

  updateProfileData() async {
    setState(() {
      nameController.text.isEmpty ? _nameValid = false : _nameValid = true;
      userNameController.text.isEmpty
          ? _usernameValid = false
          : _usernameValid = true;
      emailController.text.isEmpty ? _emailValid = false : _emailValid = true;
    });
    if (_nameValid && _usernameValid && _emailValid) {
      usersRef.doc(NavBar.currentUser.id).update({
        "name": nameController.text,
        "username": userNameController.text,
        "email": emailController.text,
      });
      var message;
      if (emailController.text.isEmpty) {
        print(
            "-------------------------------in update profile -------------------- \n email empty");
      } else {
        print(
            "-------------------------------in update profile --------------------");
        print("email not empty");
        print(emailController.text);
      }

      auth.currentUser //user _auth.currentUser instead
          .updateEmail(emailController.text)
          .then(
            (value) => message = 'success',
      )
          .catchError((onError) => message = 'email update failed');
      SnackBar snackBar =
      SnackBar(content: Text("Profile updated")); //providing feedback
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  Column buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: Text("Name"),
        ),
        TextField(
          controller: nameController,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Color(0xFFC3C2C3), width: 2.0),
            ),
            hintText: "update display name",
            errorText: _nameValid ? null : "name cannot be empty",
          ),
        )
      ],
    );
  }

  Column buildUserNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: Text("username"),
        ),
        TextField(
          controller: userNameController,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Color(0xFFC3C2C3), width: 2.0),
            ),
            hintText: "update username",
            errorText: _usernameValid ? null : "username cannot be empty",
          ),
        )
      ],
    );
  }

  Column buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: Text("email"),
        ),
        TextField(
          controller: emailController,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Color(0xFFC3C2C3), width: 2.0),
            ),
            hintText: "update email",
            errorText: _usernameValid ? null : "username cannot be empty",
          ),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Edit Profile"),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.done,
                size: 30.0,
                color: Colors.green,
              ),
              onPressed: () => Navigator.pop(context))
        ],
      ),
      body: isLoading
          ? circularProgress()
          : ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      buildNameField(),
                      buildUserNameField(),
                      buildEmailField(),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: updateProfileData,
                  child: Text("update profile"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
