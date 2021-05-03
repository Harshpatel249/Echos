import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'addPost.dart';
import '../rewidgets/navBar.dart';
import '../rewidgets/postWrapper.dart';

class CommunityPage extends StatelessWidget {
  static String id = 'community_page';
  final CollectionReference postRef =
      FirebaseFirestore.instance.collection('users');

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
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  StreamBuilder<QuerySnapshot>(
                    stream: postRef.snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final posts = snapshot.data.docs;
                        List<PostWrapper> postWidgets = [];
                        for (var post in posts) {
                          // final postTitle = post.data('title');
                          // final postContent = post.data[]
                          print(post.data()['email']);
                          PostWrapper p = PostWrapper(
                              post.data()['email'],
                              post.data()['email'],
                              post.data()['email'],
                              false,
                              false);
                          postWidgets.add(p);
                        }
                        return Column(
                          children: postWidgets,
                        );
                      } else {
                        return Text('empty');
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
