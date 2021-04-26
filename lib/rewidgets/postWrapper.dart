import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import '../screens/viewPost.dart';

class PostWrapper extends StatelessWidget {
  PostWrapper(this.postUser, this.postTitle, this.postText, this.isViewPost,
      this.isComment);

  final String postUser;
  final String postText;
  final String postTitle;
  final bool isViewPost;
  final bool isComment;

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return !isLiked;
  }

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
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Material(
            borderRadius: BorderRadius.circular(10.0),
            elevation: 5.00,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    postTitle,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    width: 150,
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    postText,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 5,
                height: 0,
              ),
              isComment
                  ? Text('')
                  : LikeButton(
                      onTap: onLikeButtonTapped,
                      likeCount: 69,
                    ),
              SizedBox(
                width: 100,
              ),
              Spacer(flex: 1),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 7),
                child: isViewPost
                    ? null
                    : GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ViewPost.id);
                        },
                        child: Text(
                          'Comments',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
