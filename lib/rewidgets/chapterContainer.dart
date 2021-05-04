import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:sign_language_tutor/models/channel_model.dart';
import 'package:sign_language_tutor/models/video_model.dart';
import 'package:sign_language_tutor/screens/quiz/quiz_screen.dart';
import 'package:sign_language_tutor/screens/reading_material/reading_material_screen.dart';
import 'package:sign_language_tutor/screens/video/build_video.dart';
import 'package:sign_language_tutor/screens/video/video_screen.dart';
import 'package:sign_language_tutor/services/api_service.dart';

class ChapterContainer extends StatefulWidget {
  @override
  _ChapterContainerState createState() => _ChapterContainerState();
}

class _ChapterContainerState extends State<ChapterContainer> {
  Channel _channel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UCH6_JCK8U503LgaDRLFllAQ');
    setState(() {
      _channel = channel;
    });
  }

  _createVideo() {
    Video video = _channel.videos[0];
    return BuildVideo(video);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
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
                    'Chapter 1',
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ReadingMaterialScreen.id);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black45,
                        border: Border.all(color: Colors.white),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('Reading Material'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, QuizScreen.id);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black45,
                        border: Border.all(color: Colors.white),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('Quiz'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
