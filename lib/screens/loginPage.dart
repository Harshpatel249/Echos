import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tutor/models/userModel.dart';
import 'package:sign_language_tutor/screens/userProfile.dart';

import 'signupPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({@required this.routeTo});
  String routeTo;
  static String id = 'login_page';
  static UserModel currentUser;
  static final postsRef = FirebaseFirestore.instance.collection('posts');
  @override
  _LoginPageState createState() => _LoginPageState(routeTo: this.routeTo);
}

class _LoginPageState extends State<LoginPage> {
  _LoginPageState({this.routeTo});
  String routeTo;
  @override
  initState() {
    super.initState();
    this.checkAuthentication();
    print('init state called');
  }

  ///////////////////////////////////////////////////////////////////////////
  /////////////         Login Methods                      //////
  ///////////////////////////////////////////////////////////////////////
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final usersRef = FirebaseFirestore.instance.collection('users');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User user;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        //DocumentSnapshot doc = await usersRef.doc(_auth.currentUser.uid).get();
        // if (doc.exists) {
        //   print('-------------------Login Page-------------');
        //   print('Document Fetched in Login Page ');
        //   LoginPage.currentUser = UserModel.fromDocument(doc);
        //   print('---------------instance of the login page -------------');
        //   print(LoginPage.currentUser.id);
        //
        //   print('login successful');
        //   print('redirecting user to difficultyPage');
        //   // await _auth.currentUser
        //   //     .updateProfile(displayName: LoginPage.currentUser.name);
        //
        // }
        this.routeTo == UserProfile.id
            ? Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => UserProfile(
                          auth: this._auth,
                        )),
                (route) => false)
            : Navigator.pushNamedAndRemoveUntil(
                context, this.routeTo, (route) => false);
      }
    });
  }

  login() async {
    _formKey.currentState.save();
    try {
      await _auth.signInWithEmailAndPassword(
          email: this.email, password: this.Password);

      print(
          "--------------------------- inside the Login up page---------------------");
      // DocumentSnapshot doc = await usersRef.doc(_auth.currentUser.uid).get();
      // if (doc.exists) {
      //   print('Document fetched');
      // } else {
      //   print('Error in fetching doc');
      // }
      // // print(doc['joining_date'][0]);
      // LoginPage.currentUser = UserModel.fromDocument(doc);
      //
      // print(LoginPage.currentUser.name);
      // //print(SignupPage.currentUser.timestamp);
      if (user != null) {
        // await _auth.currentUser
        //     .updateProfile(displayName: LoginPage.currentUser.name);
      }
    } catch (e) {
      print('shit went sideways');
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

  String email;
  String Password;

  final emailCon = new TextEditingController();
  final PasswordCon = new TextEditingController();

  bool visi1 = true;
  IconData i1 = Icons.visibility;

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
            'Login',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          // helps to scroll the page and doesn't give error of cannot display screen
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
                ElevatedButton(
                  onPressed: () {
                    //_formKey.currentState.validate();
                    setState(() {
                      if (_formKey.currentState.validate()) {
                        email = emailCon.text;
                        Password = PasswordCon.text;
                        login();
                        print('$email, $Password');
                      }
                    });
                  },
                  child: Text('Log In',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignupPage.id);
                  },
                  child: Text(
                    'Don\'t have an account? Sign Up',
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
