import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tutor/rewidgets/navBar.dart';
import 'package:sign_language_tutor/screens/viewPost.dart';

final postsRef = FirebaseFirestore.instance.collection('posts');

class PostWrapper extends StatelessWidget {
  static bool isViewPost = false;
  final String postId;
  final String ownerId;
  final String username;
  final String title;
  final String content;
  final dynamic likes;
  int likeCount;
  bool isLiked;

  final String comment;
  final String commentOwner;

  PostWrapper({
    this.postId,
    this.ownerId,
    this.username,
    this.title,
    this.content,
    this.likes,
    this.likeCount,
    this.isLiked,
    // this.isViewPost,
    this.comment,
    this.commentOwner,
  });

  factory PostWrapper.fromDocument(DocumentSnapshot doc, bool isViewPost) {
    PostWrapper.isViewPost = isViewPost;
    if (isViewPost) {
      print(
          "####################${doc['comment']} + ${doc['commentOwner']}############initialized successfully ");

      return PostWrapper(
        comment: doc['comment'],
        commentOwner: doc['commentOwner'],
      );
    } else {
      return PostWrapper(
        postId: doc['postId'],
        ownerId: doc['ownerId'],
        username: doc['username'],
        title: doc['title'],
        content: doc['content'],
        likes: doc['likes'],
      );
    }
  }
  int getLikeCount() {
    //if no likes, return 0
    if (likes == null) {
      return 0;
    }
    int count = 0;
    //if the key is explicitly set to true, add a like
    likes.values.forEach((val) {
      if (val == true) {
        count += 1;
      }
    });
    return count;
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return !isLiked;
  }

  handleLikePost() {
    this.likeCount = this.getLikeCount();
    bool _isLiked = likes[NavBar.currentUser.id] == true;
    if (_isLiked) {
      postsRef.doc(postId).update({'likes.${NavBar.currentUser.id}': false});
      likeCount -= 1;
      isLiked = false;
      likes[NavBar.currentUser.id] = false;
    } else if (!_isLiked) {
      postsRef.doc(postId).update({'likes.${NavBar.currentUser.id}': true});
      likeCount += 1;
      isLiked = true;
      likes[NavBar.currentUser.id] = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(
        '-------------------inside the  build of postWrapper----------------------- ');
    print("$commentOwner + : $comment");
    // isViewPost = false;
    print(NavBar.currentUser.id);
    //print(likes[LoginPage.currentUser.id]);
    if (!isViewPost) {
      print('not a viewpost');
      isLiked = (likes[NavBar.currentUser.id] == true);
    }
    // isLiked = (likes[LoginPage.currentUser.id] == true);
    // print("$title + $content + $username");
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Text(
              PostWrapper.isViewPost ? commentOwner : username,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Material(
            borderRadius: BorderRadius.circular(6.0),
            elevation: 5.0,
            color: Color(0xFF3B97FE),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PostWrapper.isViewPost
                      ? SizedBox(
                          height: 0,
                          width: 0,
                        )
                      : Text(
                          title,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                  PostWrapper.isViewPost
                      ? SizedBox(
                          height: 0,
                          width: 0,
                        )
                      : SizedBox(
                          height: 10,
                          width: 150,
                          child: Divider(
                            thickness: 1,
                            color: Colors.white,
                          ),
                        ),
                  Text(
                    PostWrapper.isViewPost ? comment : content,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          PostWrapper.isViewPost
              ? SizedBox(
                  height: 0,
                  width: 0,
                )
              : SizedBox(
                  height: 3,
                ),
          PostWrapper.isViewPost
              ? SizedBox(
                  height: 0,
                  width: 0,
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 5,
                      height: 0,
                    ),
                    GestureDetector(
                      onTap: handleLikePost,
                      child: PostWrapper.isViewPost
                          ? Text(' ')
                          : Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                              size: 28.0,
                              color: isLiked ? Colors.red : Colors.blueGrey,
                            ),
                    ),
                    // isComment
                    //     ? Text('')
                    //     : LikeButton(
                    //         onTap: onLikeButtonTapped,
                    //         likeCount: 69,
                    //       ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 4),
                      child: Container(
                        child: getLikeCount() > 1
                            ? Text(
                                "${getLikeCount()} likes",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                "${getLikeCount()} like",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                    Spacer(flex: 1),
                    Padding(
                      padding: const EdgeInsets.only(top: 4, right: 7),
                      child: PostWrapper.isViewPost
                          ? Text(' ')
                          : GestureDetector(
                              onTap: () {
                                PostWrapper.isViewPost = true;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewPost(
                                            postId: postId,
                                            currentUserId: ownerId,
                                            username: username,
                                            title: title,
                                            content: content)));
                              },
                              child: Text(
                                'Comments',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                      // child: isViewPost
                      //     ? null
                      //     : GestureDetector(
                      //         onTap: () {
                      //           Navigator.pushNamed(context, ViewPost.id);
                      //         },
                      //         child: Text(
                      //           'Comments',
                      //           style: TextStyle(
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.w700,
                      //           ),
                      //         ),
                      //       ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
