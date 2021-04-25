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
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.black, Colors.blue]),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Echoes'),
          ),
          bottomNavigationBar: NavBar(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(Icons.add),
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
              Text(
                'Community Posts',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFF1FAEE),
                ),
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
      ),
    );
  }
}
