import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tutor/rewidgets/navBar.dart';

final commentsRef = FirebaseFirestore.instance.collection('comments');

class AddComment extends StatefulWidget {
  String postId;
  String currentUserId;

  AddComment({
    this.postId,
    this.currentUserId,
  });
  @override
  _AddCommentState createState() => _AddCommentState(
        postId: this.postId,
        currentUserId: this.currentUserId,
      );
}

class _AddCommentState extends State<AddComment> {
  String _comment;
  final commentController = TextEditingController();
  bool commentEmpty = false;

  String postId;
  String username = NavBar.currentUser.username;
  String currentUserId;

  _AddCommentState({
    this.postId,
    this.currentUserId,
  });

  addComment() {
    commentsRef.doc(postId).collection('comments').add({
      "commentOwner": username,
      "comment": _comment,
      "timestamp": DateTime.now(),
      "userId": currentUserId,
    });
    commentController.clear();
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
                    'Add comment',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                      errorText: commentEmpty ? 'Cannot be empty' : null,
                    ),
                    textAlign: TextAlign.center,
                    autofocus: true,
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
                        commentController.text.isEmpty
                            ? commentEmpty = true
                            : commentEmpty = false;
                        if (!commentEmpty) {
                          _comment = commentController.text;
                          addComment();
                          Navigator.pop(context);
                        }
                      });
                      //Add function
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
