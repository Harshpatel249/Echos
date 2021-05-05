import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tutor/rewidgets/postWrapper.dart';
import 'package:sign_language_tutor/rewidgets/progress.dart';
import 'package:sign_language_tutor/screens/addComment.dart';
import 'package:sign_language_tutor/screens/communityPage.dart';

import '../rewidgets/navBar.dart';
import '../rewidgets/postWrapper.dart';

class ViewPost extends StatefulWidget {
  static String id = 'view_post';
  String postId;
  String currentUserId;
  String username;
  String title;
  String content;

  ViewPost({
    this.postId,
    this.currentUserId,
    this.username,
    this.title,
    this.content,
  });

  @override
  _ViewPostState createState() => _ViewPostState(
        postId: this.postId,
        currentUserId: this.currentUserId,
        username: this.username,
        title: this.title,
        content: this.content,
      );
}

class _ViewPostState extends State<ViewPost> {
  final commentsRef = FirebaseFirestore.instance.collection('comments');
  String postId;
  String currentUserId;
  String username;
  String title;
  String content;

  _ViewPostState({
    this.postId,
    this.currentUserId,
    this.username,
    this.title,
    this.content,
  });

  buildComments() {
    return StreamBuilder<QuerySnapshot>(
      stream: commentsRef.doc(postId).collection('comments').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          print('snapshot empty############################');
          return circularProgress();
        }
        List<PostWrapper> comments = [];
        snapshot.data.docs.forEach((doc) {
          // print('#############${doc.data().toString()}');
          comments.add(PostWrapper.fromDocument(doc, true));
        });
        return ListView(
          children: comments,
        );
      },
    );
  }

  // final PostWrapper p = PostWrapper(
  //     'Laura Hugh',
  //     'Lorem lodum',
  //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  //     true,
  //     true);
  // final PostWrapper p1 = PostWrapper(
  //     'Laura Hugh',
  //     'Lorem lodum',
  //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  //     true,
  //     false);

  @override
  Widget build(BuildContext context) {
    print(
        '##################$title + $content + $username############# in the build of viewpost');
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.black, Colors.blue]),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Comments',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: NavBar(
            id: CommunityPage.id,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => AddComment(
                        postId: postId,
                        currentUserId: currentUserId,
                      ));
            },
          ),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                '$username\'s Post',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Material(
                borderRadius: BorderRadius.circular(6.0),
                elevation: 5.0,
                color: Color(0xFF3B97FE),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                        width: 150,
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        content,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // p1,
              // Padding(
              //   padding: const EdgeInsets.only(left: 10),
              //   child: Text(
              //     'Comments',
              //     textAlign: TextAlign.start,
              //     style: TextStyle(
              //       fontSize: 16,
              //     ),
              //   ),
              // ),
              Expanded(
                child: buildComments(),
              ),
            ],
          ),
          // ),
        ),
      ),
    );
  }
}
