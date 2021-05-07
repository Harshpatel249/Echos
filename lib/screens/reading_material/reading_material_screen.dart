import 'package:flutter/material.dart';
import 'package:sign_language_tutor/screens/reading_material/reading_element.dart';

class ReadingMaterialScreen extends StatelessWidget {
  String str = 'asdfjkl;';
  final List<dynamic> reading;
  ReadingMaterialScreen({this.reading});

  static String id = 'reading_material';
  // final elements = [];
  // final elements = const [
  //   {
  //     'title': 'Aa',
  //     'imageSrc': 'assets/images/first.jpg',
  //     'steps':
  //         'Let’s look at the types of ListViews there are:\n1. one \n2. two \n3. three'
  //   },
  //   {
  //     'title': 'Bb',
  //     'imageSrc': 'assets/images/second.jpg',
  //     'steps':
  //         'Let’s look at the types of ListViews there are:\n1. one \n2. two \n3. three'
  //   },
  //   {
  //     'title': 'Cc',
  //     'imageSrc': 'assets/images/third.jpg',
  //     'steps':
  //         'Let’s look at the types of ListViews there are:\n1. one \n2. two \n3. three'
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    print(
        '-----------------inside the build of reading material screen--------------------------');
    print(reading[0]['title']);
    // print(elements);
    print('inside the build of reading material screen');
    // print(reading);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reading Material',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: reading.length,
        itemBuilder: (context, index) {
          str = reading[index]['steps'];
          print(str);
          str = str.replaceAll("\\n", "\n");
          print(str);
          reading[index]['steps'] = str;
          // reading[index]['steps'].replaceAll('\n', 'asdf');
          return ReadingElement(reading[index]['title'],
              reading[index]['steps'], reading[index]['imageSrc']);
        },
      ),
    );
  }
}
