import 'package:firebase_auth/firebase_auth.dart';

class SignUpLogin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  Future checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        print('user is null');
        return false;
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Start()));
      } else {
        return true;
      }
    });
  }
}
