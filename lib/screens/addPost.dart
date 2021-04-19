import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1D3557),
      child: ListView(
        children: [
          Container(
            color: Color(0xFF001427),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF1D3557),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Create your post',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'Post Title:',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    maxLength: 50,
                    cursorColor: Colors.white,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Post description:',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    maxLength: 300,
                    cursorColor: Colors.white,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    child: Text(
                      'Post',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {
                      //Add function
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.cyan,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
