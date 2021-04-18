import 'package:flutter/material.dart';
import '../services/getCommunityPosts.dart';

class CommunityPage extends StatelessWidget {
  static String id = 'community_page';
  final GetCommunityPosts g1 = GetCommunityPosts();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Community Posts',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFFF1FAEE),
              ),
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
    );
  }
}
