import 'package:flutter/material.dart';
import 'package:sign_language_tutor/models/video_model.dart';
import 'package:sign_language_tutor/screens/video/video_screen.dart';

class BuildVideo extends StatelessWidget {
  final Video video;

  BuildVideo(this.video);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(videoID: video.id),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
        padding: EdgeInsets.all(10.0),
        height: 140.0,
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image(
              width: 150.0,
              image: NetworkImage(video.thumbnailUrl),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Text(
                video.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
