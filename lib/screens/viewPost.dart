import 'package:flutter/material.dart';
import '../rewidgets/postWrapper.dart';
import 'addComment.dart';
import '../rewidgets/navBar.dart';
import 'communityPage.dart';

class ViewPost extends StatelessWidget {
  static String id = 'view_post';

  final PostWrapper p = PostWrapper(
      'Laura Hugh',
      'Lorem lodum',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      true,
      true);
  final PostWrapper p1 = PostWrapper(
      'Laura Hugh',
      'Lorem lodum',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      true,
      false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // child: Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: Alignment.bottomLeft,
      //         end: Alignment.topRight,
      //         colors: [Colors.black, Colors.blue]),
      //   ),

      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Community Posts',
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
                context: context, builder: (context) => AddComment());
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
              'Laura Hugh\'s Post',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            p1,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Comments',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  p,
                ],
              ),
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
