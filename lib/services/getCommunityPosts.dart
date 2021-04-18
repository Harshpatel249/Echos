import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetCommunityPosts {
  List<PostWrapper> posts = [];

  List<Text> text = [];
  List<PostWrapper> getPosts() {
    final PostWrapper p = PostWrapper('Laura Hugh',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.');
    posts.add(p);
    final PostWrapper p2 = PostWrapper('Laura Hugh',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.');
    posts.add(p2);
    return posts;
  }
}

class PostWrapper extends StatelessWidget {
  PostWrapper(this.postUser, this.postText);

  final String postUser;
  final String postText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            postUser,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFFF1FAEE),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Material(
            borderRadius: BorderRadius.circular(10.0),
            elevation: 5.00,
            color: Color(0xFFA8DADC),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Text(
                postText,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
