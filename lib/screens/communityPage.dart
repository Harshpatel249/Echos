import 'package:flutter/material.dart';
import '../services/getCommunityPosts.dart';
import 'addPost.dart';
import '../rewidgets/navBar.dart';

class CommunityPage extends StatelessWidget {
  static String id = 'community_page';
  final GetCommunityPosts g1 = GetCommunityPosts();

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
          title: Text('Community Posts'),
          centerTitle: true,
        ),
        bottomNavigationBar: NavBar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF5eaaa8),
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
              child: ListView(
                scrollDirection: Axis.vertical,
                children: g1.getPosts(),
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
