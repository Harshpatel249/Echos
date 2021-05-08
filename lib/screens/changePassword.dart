import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sign_language_tutor/rewidgets/navBar.dart';

import '../rewidgets/navBar.dart';

final passRef = FirebaseFirestore.instance.collection('users');

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool visi1 = true;
  bool visi2 = true;
  bool visi3 = true;
  IconData i1 = Icons.visibility;
  IconData i2 = Icons.visibility;
  IconData i3 = Icons.visibility;
  final oldpasswordController = new TextEditingController();
  final passwordController = new TextEditingController();
  final repasswordController = new TextEditingController();
  bool oldpasswordempty = true;
  bool passwordempty = true;
  bool repasswordempty = true;
  String password;
  String currentpass;
  String message;

  final _formKey = GlobalKey<FormState>();

  getCurrentPassword() async {
    final DocumentSnapshot snap =
        await passRef.doc(NavBar.currentUser.id).get();
    currentpass = snap['password'];
    print('--------------------------------------');
  }

  Future resetPassword(String newPassword) async {
    var message;
    User firebaseUser = FirebaseAuth.instance.currentUser;
    firebaseUser
        .updatePassword(newPassword)
        .then(
          (value) => message = 'Success',
        )
        .catchError((onError) => message = 'error');
    return message;
  }

  updatePassword() async {
    password = passwordController.value.text;
    passRef.doc(NavBar.currentUser.id).update({"password": password});
    resetPassword(password);
    oldpasswordController.clear();
    passwordController.clear();
    repasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: visi1,
                controller: oldpasswordController,
                validator: (String value) {
                  getCurrentPassword();
                  if (value.isEmpty) {
                    return 'Password cannot be empty';
                  } else if (value.length < 6) {
                    return 'Password too small';
                  }
                  if (!(identical(currentpass, oldpasswordController.text))) {
                    return 'Please enter the current password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Enter Current Password",
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        visi1 = !visi1;
                        if (visi1)
                          i1 = Icons.visibility;
                        else
                          i1 = Icons.visibility_off;
                      });
                    },
                    child: Icon(
                      i1,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: visi2,
                controller: passwordController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Password cannot be empty';
                  } else if (value.length < 6) {
                    return 'Password too small';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Enter New Password",
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        visi2 = !visi2;
                        if (visi2)
                          i2 = Icons.visibility;
                        else
                          i2 = Icons.visibility_off;
                      });
                    },
                    child: Icon(
                      i2,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: visi3,
                controller: repasswordController,
                validator: (String value) {
                  if (value != passwordController.value) {
                    return 'Password do not match!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Re-enter New Password",
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        visi3 = !visi3;
                        if (visi3)
                          i3 = Icons.visibility;
                        else
                          i3 = Icons.visibility_off;
                      });
                    },
                    child: Icon(
                      i3,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                _formKey.currentState.validate();
                setState(() {
                  updatePassword();
                  Navigator.pop(context);
                });
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
