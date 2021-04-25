import 'package:flutter/material.dart';
import 'loginPage.dart';

class SignupPage extends StatefulWidget {
  static String id = 'signup_page';
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String email, fname, lname, Password, confirmPassword;
  final _formKey = GlobalKey<FormState>();
  final emailCon = new TextEditingController();
  final fnameCon = new TextEditingController();
  final lnameCon = new TextEditingController();
  final PasswordCon = new TextEditingController();
  final confirmPasswordCon = new TextEditingController();
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
          title: Text('Sign up'),
          centerTitle: true,
          backgroundColor: Colors.white12,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
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
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            controller: fnameCon,
                            keyboardType: TextInputType.name,
                            decoration: new InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white54, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0),
                              ),
                              hintText: 'First Name',
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            controller: lnameCon,
                            keyboardType: TextInputType.emailAddress,
                            decoration: new InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white54, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0),
                              ),
                              hintText: 'Last Name',
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: PasswordCon,
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
                          borderSide:
                              BorderSide(color: Colors.white54, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: confirmPasswordCon,
                      validator: (String value) {
                        if (value != PasswordCon.value.text) {
                          return 'Password do not match!';
                        }
                        return null;
                      },
                      decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white54, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //_formKey.currentState.validate();
                      setState(() {
                        if (_formKey.currentState.validate()) {
                          fname = fnameCon.text;
                          lname = lnameCon.text;
                          email = emailCon.text;
                          Password = PasswordCon.text;
                          confirmPassword = confirmPasswordCon.text;
                          print(
                              '$fname, $lname, $email, $Password,$confirmPassword');
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
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                    child: Text(
                      'Click here to Login',
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
        ),
        // ),
      ),
    );
  }
}
