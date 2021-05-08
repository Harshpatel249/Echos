import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tutor/models/channel_model.dart';
import 'package:sign_language_tutor/models/video_model.dart';
import 'package:sign_language_tutor/rewidgets/navBar.dart';
import 'package:sign_language_tutor/screens/quiz/quiz_screen.dart';
import 'package:sign_language_tutor/screens/reading_material/reading_material_screen.dart';
import 'package:sign_language_tutor/screens/video/build_video.dart';
import 'package:sign_language_tutor/services/api_service.dart';

class ChapterContainer extends StatefulWidget {
  DocumentSnapshot doc;
  CollectionReference chaptersRef;
  int chapNum;
  ChapterContainer({
    this.doc,
    this.chaptersRef,
    this.chapNum,
  });

  factory ChapterContainer.fromDocument(
      DocumentSnapshot doc, CollectionReference chaptersRef) {
    print(
        '########################## inside the .fromDocument ################');
    // chaptersRef.get().then((QuerySnapshot querySnapshot) {
    //   querySnapshot.docs.forEach((doc) {
    //     print(doc['difficulty']);
    //   });
    // });

    return ChapterContainer(
      doc: doc,
      chaptersRef: chaptersRef,
      chapNum: doc['chapNum'],
    );
  }

  @override
  ChapterContainerState createState() =>
      ChapterContainerState(chapNum: this.chapNum);
}

class ChapterContainerState extends State<ChapterContainer> {
  Channel _channel;
  bool _isLoading = false;
  QuerySnapshot chaptersQuiz;
  QuerySnapshot readingCollection;
  QuerySnapshot usersCollection;
  List<dynamic> reading = [];
  List<dynamic> questions = [];
  int videoIndex;
  dynamic status;
  bool videoDone = false;
  bool readingDone = false;
  bool quizDone = false;
  int chapNum;

  ChapterContainerState({this.chapNum});

  getSubCollections() async {
    chaptersQuiz =
        await widget.chaptersRef.doc(widget.doc.id).collection('quiz').get();
    chaptersQuiz.docs.forEach((doc) {
      questions.add(doc.data());
    });

    readingCollection = await widget.chaptersRef
        .doc(widget.doc.id)
        .collection('reading')
        .orderBy('title')
        .get();

    readingCollection.docs.forEach((doc) {
      reading.add(doc.data());
    });

    videoIndex = widget.doc['videoIndex'];
    widget.chaptersRef.doc(NavBar.currentUser.id);
  }

  Future<bool> checkIfDocExists(String docId) async {
    try {
      var collectionRef =
          widget.chaptersRef.doc(widget.doc.id).collection('users');
      var doc = await collectionRef.doc(docId).get();
      return doc.exists;
    } catch (e) {
      throw e;
    }
  }

  updateStatus(bool status, String str) {
    widget.chaptersRef
        .doc(widget.doc.id)
        .collection('users')
        .doc(NavBar.currentUser.id)
        .update({'status.$str': status});
  }

  addUserToChaptersCollection() async {
    bool exists = await checkIfDocExists(NavBar.currentUser.id);

    if (!exists) {
      widget.chaptersRef
          .doc(widget.doc.id)
          .collection('users')
          .doc(NavBar.currentUser.id)
          .set({
        "status": {
          "videoDone": false,
          "readingDone": false,
          "quizDone": false,
        }
      });
      DocumentSnapshot snapshot = await widget.chaptersRef
          .doc(widget.doc.id)
          .collection('users')
          .doc(NavBar.currentUser.id)
          .get();
      print(snapshot.data());
    } else {
      print('userdocument exists');
    }
  }

  getStatus() async {
    var doc = await widget.chaptersRef
        .doc(widget.doc.id)
        .collection('users')
        .doc(NavBar.currentUser.id)
        .get();
    status = doc['status'];
    print(
        '===================================== inside the get status method ====================================');
    print(status);
    setState(() {
      videoDone = status['videoDone'];
      readingDone = status['readingDone'];
      quizDone = status['quizDone'];
    });
  }

  @override
  initState() {
    print('init of chaptercontainer is called');
    super.initState();
    getSubCollections();
    addUserToChaptersCollection();
    getStatus();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UC7BnSPX4C-b2GyLY2ZBIS9A');
    setState(() {
      _channel = channel;
    });
  }

  _createVideo(DocumentSnapshot doc, CollectionReference chaptersRef) {
    Video video = _channel.videos[videoIndex];
    return BuildVideo(video: video, doc: doc, chaptersRef: chaptersRef);
  }

  @override
  Widget build(BuildContext context) {
    print(
        '--------------------------------------------build method of chapterContainer is called----------------------------');
    // print(videoIndex.runtimeType);
    // print(videoDone);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(6),
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF3B97FE), Color(0xFF13DFEF)]),
          ),
          child: ExpandableTheme(
            data: ExpandableThemeData(
              iconColor: Colors.white,
              iconPadding: EdgeInsets.only(top: 10, right: 10, left: 10),
            ),
            child: ExpandablePanel(
              header: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      'Chapter ${widget.doc['chapNum']}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(flex: 1),
                    SizedBox(
                      height: 4,
                      width: 40,
                      child: videoDone
                          ? DecoratedBox(
                              decoration: const BoxDecoration(
                                color: Colors.lightGreenAccent,
                              ),
                            )
                          : DecoratedBox(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                            ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 4,
                      width: 40,
                      child: readingDone
                          ? DecoratedBox(
                              decoration: const BoxDecoration(
                                color: Colors.lightGreenAccent,
                              ),
                            )
                          : DecoratedBox(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                            ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 4,
                      width: 40,
                      child: quizDone
                          ? DecoratedBox(
                              decoration: const BoxDecoration(
                                color: Colors.lightGreenAccent,
                              ),
                            )
                          : DecoratedBox(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              collapsed: null,
              expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black45,
                        border: Border.all(color: Colors.white),
                      ),
                      child: _channel != null
                          ? _createVideo(widget.doc, widget.chaptersRef)
                          : Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).primaryColor, // Red
                                ),
                              ),
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        updateStatus(true, 'readingDone');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReadingMaterialScreen(
                              reading: reading,
                            ),
                          ),
                        );
                        // Navigator.pushNamed(context, ReadingMaterialScreen.id);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black45,
                          border: Border.all(color: Colors.white),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Reading Material',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        updateStatus(true, 'quizDone');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(
                              questions: this.questions,
                              doc: widget.doc,
                              chaptersRef: widget.chaptersRef,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black45,
                          border: Border.all(color: Colors.white),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Quiz',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
