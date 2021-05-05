import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tutor/rewidgets/progress.dart';

import '../rewidgets/navBar.dart';
import '../rewidgets/postWrapper.dart';
import 'addPost.dart';

class CommunityPage extends StatelessWidget {
  static String id = 'community_page';
  //final GetCommunityPosts g1 = GetCommunityPosts();
  final postsRef = FirebaseFirestore.instance.collection('posts');
  final usersRef = FirebaseFirestore.instance.collection('users');

  buildPosts() {
    return StreamBuilder<QuerySnapshot>(
      stream: postsRef.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        List<PostWrapper> posts = [];
        snapshot.data.docs.forEach((doc) {
          posts.add(PostWrapper.fromDocument(doc, false));
        });
        return ListView(
          children: posts,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // child: Container(
      //   decoration: BoxDecoration(
      //     color: Color(0xFFf7f3e9),
      //     //   gradient: LinearGradient(
      //     //       begin: Alignment.bottomLeft,
      //     //       end: Alignment.topRight,
      //     //       colors: [Colors.black, Colors.blue]),
      //   ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Community Posts',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: NavBar(id: CommunityPage.id),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF000000),
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            showModalBottomSheet(
                context: context, builder: (context) => AddPost());
          },
        ),
        // floatingActionButtonLocation:
        // FloatingActionButtonLocation.centerDocked,
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: buildPosts(),
              // child: ListView(
              //   scrollDirection: Axis.vertical,
              //   children: g1.getPosts(),
              // ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}

// class Post extends StatelessWidget {
//   final String postId;
//   final String ownerId;
//   final String username;
//   final String title;
//   final String content;
//   final dynamic likes;
//
//   Post({
//     this.postId,
//     this.ownerId,
//     this.title,
//     this.username,
//     this.content,
//     this.likes,
//   });
//   factory Post.fromDocument(DocumentSnapshot doc) {
//     return Post(
//       postId: doc['postId'],
//       ownerId: doc['ownerId'],
//       username: doc['username'],
//       title: doc['title'],
//       content: doc['content'],
//       likes: doc['likes'],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Text('Post');
//   }
// }
