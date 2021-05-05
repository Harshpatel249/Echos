import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tutor/rewidgets/navBar.dart';
import 'package:uuid/uuid.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  String _title;
  String _postContent;
  String postId = Uuid().v4();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//---------------------Add post backend----------------------//
  addPost() {
    print('makePost is called');
    print(NavBar.currentUser.id);
//    if (_formKey.currentState.validate()) {
    //     _formKey.currentState.save();
    //upload post
    NavBar.postsRef.doc(postId).set({
      "postId": postId,
      "ownerId": NavBar.currentUser.id,
      "username": NavBar.currentUser.username,
      "title": _title,
      "content": _postContent,
      "timestamp": DateTime.now(),
      "likes": {},
    });
    // }
  }

//----------------------------------------------------------//
  final titleController = TextEditingController();
  bool titleEmpty = false;

  final contentController = TextEditingController();
  bool contentEmpty = false;

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
                    controller: titleController,
                    decoration: InputDecoration(
                      errorText: titleEmpty ? 'Cannot be empty' : null,
                    ),
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
                    controller: contentController,
                    decoration: InputDecoration(
                      errorText: contentEmpty ? 'Cannot be empty' : null,
                    ),
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
                    onPressed: () {
                      setState(() {
                        titleController.text.isEmpty
                            ? titleEmpty = true
                            : titleEmpty = false;
                        contentController.text.isEmpty
                            ? contentEmpty = true
                            : contentEmpty = false;
                      });
                      if (!titleEmpty && !contentEmpty) {
                        _title = titleController.text;
                        _postContent = contentController.text;
                        addPost();
                        Navigator.pop(context);
                      }
                    },
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
