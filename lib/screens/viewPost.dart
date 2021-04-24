import 'package:flutter/material.dart';
import '../rewidgets/postWrapper.dart';
import 'addComment.dart';
import '../rewidgets/navBar.dart';

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
      child: Scaffold(
        appBar: AppBar(
          title: Text('Echoes'),
          centerTitle: true,
        ),
        bottomNavigationBar: NavBar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context, builder: (context) => AddComment());
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                color: Color(0xFFF1FAEE),
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
                  color: Color(0xFFF1FAEE),
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
      ),
    );
  }
}
