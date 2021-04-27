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
                    controller: lnameCon,
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