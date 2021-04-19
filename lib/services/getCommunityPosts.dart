import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../rewidgets/postWrapper.dart';

class GetCommunityPosts {
  List<PostWrapper> posts = [];

  List<Text> text = [];
  List<PostWrapper> getPosts() {
    final PostWrapper p = PostWrapper(
        'Laura Hugh',
        'Lorem lodum',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        false);
    posts.add(p);
    final PostWrapper p2 = PostWrapper(
        'Laura Hugh',
        'Lorem lodum',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        false);
    posts.add(p2);
    final PostWrapper p3 = PostWrapper(
        'Laura Hugh',
        'Lorem lodum',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        false);
    posts.add(p3);
    final PostWrapper p4 = PostWrapper(
        'Laura Hugh',
        'Lorem lodum',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        false);
    posts.add(p4);
    final PostWrapper p5 = PostWrapper(
        'Laura Hugh',
        'Lorem lodum',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        false);
    posts.add(p5);
    return posts;
  }
}
