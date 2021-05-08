import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tutor/models/userModel.dart';

import 'loginPage.dart';

class SignupPage extends StatefulWidget {
  static String id = 'signup_page';
  static UserModel currentUser;
  static DateTime timestamp = DateTime.now();
  static final postsRef = FirebaseFirestore.instance.collection('posts');
  // UserModel getUserModelInstance() {
  //   return this.currentUser;
  // }
  String routeTo;
  SignupPage({this.routeTo});

  @override
  SignupPageState createState() => SignupPageState(routeTo: this.routeTo);
}

class SignupPageState extends State<SignupPage> {
  /////////////////////////////////////////////////////////////////////////////
  //          Sign up functions
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final usersRef = FirebaseFirestore.instance.collection('users');

  String routeTo;
  SignupPageState({this.routeTo});

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoginPage(
                      routeTo: this.routeTo,
                    )));
      }
    });
  }

  signUp() async {
    _formKey.currentState.save();
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: this.email, password: this.Password);
      usersRef.doc(_auth.currentUser.uid).set({
        // We want to make this created data accessible whithin out app regardless of whether users just signed or not
        "id": _auth.currentUser.uid,
        "name": fname,
        "email": email,
        "username": userName,
        "password": Password,
        "joining_date": SignupPage.timestamp,
        "lastChapId": "No Attempts",
      });
      // print(
      //     "--------------------------- inside the sign up page---------------------");
      // DocumentSnapshot doc = await usersRef.doc(_auth.currentUser.uid).get();
      // if (doc.exists) {
      //   print('Document fetched');
      // } else {
      //   print('Error in fetching doc');
      // }
      // // print(doc['joining_date'][0]);
      // SignupPage.currentUser = UserModel.fromDocument(doc);
      //
      // print(SignupPage.currentUser.name);
      // //print(SignupPage.currentUser.timestamp);
      // if (user != null) {
      //   await _auth.currentUser.updateProfile(displayName: fname);
      // }
    } catch (e) {
      showError(e.errormessage);
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Error'),
              content: Text(errormessage),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Ok'))
              ]);
        });
  }

  // UserModel getUserModelInstance() {
  //   return this.currentUser;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.checkAuthentication();
  }

  ////////////////////////////////////////////////////////////////////////////

  String email, fname, userName, Password, confirmPassword;
  final _formKey = GlobalKey<FormState>();
  final emailCon = new TextEditingController();
  final fnameCon = new TextEditingController();
  final usernameCon = new TextEditingController();
  final PasswordCon = new TextEditingController();
  final confirmPasswordCon = new TextEditingController();

  bool visi1 = true;
  bool visi2 = true;
  IconData i1 = Icons.visibility;
  IconData i2 = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // child: Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: Alignment.bottomLeft,
      //         end: Alignment.topRight,
      //         colors: [Colors.black, Colors.blue]),
      //   ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign Up',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
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
                Text(
                  'Echos',
                  style: TextStyle(
                    fontFamily: 'DancingScript',
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: TextField(
                    controller: fnameCon,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.name,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFC3C2C3), width: 2.0),
                      ),
                      hintText: 'Full Name',
                      hintStyle: TextStyle(color: Colors.black45),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: TextField(
                    controller: usernameCon,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.name,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFC3C2C3), width: 2.0),
                      ),
                      hintText: 'UserName',
                      hintStyle: TextStyle(color: Colors.black45),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: TextField(
                    controller: emailCon,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFC3C2C3), width: 2.0),
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.black45),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: TextFormField(
                    obscureText: visi1,
                    controller: PasswordCon,
                    style: TextStyle(color: Colors.black),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Password cannot be empty';
                      } else if (value.length < 6) {
                        return 'Password too small';
                      }
                      return null;
                    },
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFC3C2C3), width: 2.0),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black45),
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
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: TextFormField(
                    obscureText: visi2,
                    controller: confirmPasswordCon,
                    style: TextStyle(color: Colors.black),
                    validator: (String value) {
                      if (value != PasswordCon.value.text) {
                        return 'Password do not match!';
                      }
                      return null;
                    },
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFC3C2C3), width: 2.0),
                      ),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: Colors.black45),
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
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    //_formKey.currentState.validate();
                    setState(() {
                      if (_formKey.currentState.validate()) {
                        fname = fnameCon.text;
                        userName = usernameCon.text;
                        email = emailCon.text;
                        Password = PasswordCon.text;
                        confirmPassword = confirmPasswordCon.text;
                        signUp();
                        print(
                            '$fname, $userName, $email, $Password,$confirmPassword');
                      }
                    });
                  },
                  child: Text('Sign up',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Already have an account? Log In',
                    style: TextStyle(
                        color: Colors.lightBlue[700],
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SourceSansPro',
                        fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
        // ),
      ),
    );
  }
}
