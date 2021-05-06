import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tutor/models/channel_model.dart';
import 'package:sign_language_tutor/models/video_model.dart';
import 'package:sign_language_tutor/screens/quiz/quiz_screen.dart';
import 'package:sign_language_tutor/screens/reading_material/reading_material_screen.dart';
import 'package:sign_language_tutor/screens/video/build_video.dart';
import 'package:sign_language_tutor/services/api_service.dart';

class ChapterContainer extends StatefulWidget {
  DocumentSnapshot doc;
  CollectionReference chaptersRef;

  ChapterContainer({
    this.doc,
    this.chaptersRef,
  });

  factory ChapterContainer.fromDocument(
      DocumentSnapshot doc, CollectionReference chaptersRef) {
    return ChapterContainer(
      doc: doc,
      chaptersRef: chaptersRef,
    );
  }

  @override
  _ChapterContainerState createState() => _ChapterContainerState();
}

class _ChapterContainerState extends State<ChapterContainer> {
  Channel _channel;
  bool _isLoading = false;
  QuerySnapshot chaptersQuiz;
  QuerySnapshot readingCollection;
  List<dynamic> reading = [];
  List<dynamic> questions = [];
  int videoIndex;

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
      print(doc.data());
    });
    print('###################$reading');
    videoIndex = widget.doc['videoIndex'];
    print('videos index is here#########################');
    print(videoIndex);
  }

  @override
  initState() {
    print('init of chaptercontainer is called');
    super.initState();
    getSubCollections();

    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UC7BnSPX4C-b2GyLY2ZBIS9A');
    setState(() {
      _channel = channel;
    });
  }

  _createVideo() {
    Video video = _channel.videos[videoIndex];
    return BuildVideo(video);
  }

  @override
  Widget build(BuildContext context) {
    print('build method of chapterContainer is called');
    print(videoIndex.runtimeType);
    print(videoIndex);
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
                      child: const DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Colors.lightGreenAccent,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 4,
                      width: 40,
                      child: const DecoratedBox(
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
                      child: const DecoratedBox(
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
                          ? _createVideo()
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(
                              questions: this.questions,
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
