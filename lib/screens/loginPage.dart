import 'package:flutter/material.dart';
import 'signupPage.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String pass;

  final emailCon = new TextEditingController();
  final passCon = new TextEditingController();
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
        backgroundColor: Colors.teal.shade900,
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
          backgroundColor: Colors.white12,
        ),
        body: SingleChildScrollView(
          // helps to scroll the page and doesn't give error of cannot display screen
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: 'logo',
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://thumbs.dreamstime.com/b/helping-hands-care-hands-logo-icon-vector-designs-white-background-helping-hands-care-hands-logo-icon-vector-designs-white-154382280.jpg',
                          scale: 1),
                    ),
                  ),
                ),
                Hero(
                  tag: 'logo_title',
                  child: Text(
                    'Echoes',
                    style: TextStyle(
                      fontFamily: 'DancingScript',
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: emailCon,
                    keyboardType: TextInputType.emailAddress,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white54, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    obscureText: true,
                    controller: passCon,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white54, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white70),
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
                    'Click here to Sign up',
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
      ),
    );
  }
}
