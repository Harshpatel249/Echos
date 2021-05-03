import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tutor/screens/signupPage.dart';
import 'package:uuid/uuid.dart';

class AddPost extends StatelessWidget {
  String _title = 'Can you can a can as a canner can can a can?';
  String _postContent =
      'The coldest blood runs through my vein You know my name.';
  String postId = Uuid().v4();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  addPost() {
    print('makePost is called');
    print(SignupPage.currentUser.id);
//    if (_formKey.currentState.validate()) {
    //     _formKey.currentState.save();
    //upload post
    print(SignupPage.currentUser.id);
    SignupPage.postsRef
        .doc(SignupPage.currentUser.id)
        .collection("userPosts")
        .doc(postId)
        .set({
      "postId": postId,
      "ownerId": SignupPage.currentUser.id,
      "username": SignupPage.currentUser.username,
      "title": _title,
      "content": _postContent,
      "timestamp": SignupPage.timestamp,
      "likes": {},
    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1D3557),
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF757575),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF1D3557),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Create your post',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'Post Title:',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    maxLength: 50,
                    cursorColor: Colors.white,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Post description:',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    maxLength: 300,
                    cursorColor: Colors.white,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    child: Text(
                      'Post',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: addPost,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.cyan,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
