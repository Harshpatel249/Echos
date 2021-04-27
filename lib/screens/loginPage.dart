import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'signupPage.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User user;
  checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Homepage(),
            ));
      }
    });
  }

  String email;
  String pass;

  final emailCon = new TextEditingController();
  final passCon = new TextEditingController();

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: 'logo',
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'images/ECHOS2.png',
                    ),
                  ),
                ),
              ),
              Text(
                'Echos',
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
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
                    hintStyle: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: TextField(
                  obscureText: visi1,
                  controller: passCon,
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
                    hintStyle: TextStyle(color: Colors.black54),
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
                  setState(() {
                    email = emailCon.text;
                    pass = passCon.text;
                    print('Email= $email');
                    print('Password= $pass');
                  });
                },
                child: Text('Login'),
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
        // ),
      ),
    );
  }
}
