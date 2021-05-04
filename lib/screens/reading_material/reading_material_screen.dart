import 'package:flutter/material.dart';
import '../../rewidgets/navBar.dart';
import 'package:sign_language_tutor/screens/reading_material/reading_element.dart';
import '../difficultyPage.dart';

class ReadingMaterialScreen extends StatelessWidget {
  final elements = const [
    {
      'title': 'Aa',
      'imageSrc': 'assets/images/first.jpg',
      'steps':
          'Let’s look at the types of ListViews there are:\n1. one \n2. two \n3. three'
    },
    {
      'title': 'Bb',
      'imageSrc': 'assets/images/second.jpg',
      'steps':
          'Let’s look at the types of ListViews there are:\n1. one \n2. two \n3. three'
    },
    {
      'title': 'Cc',
      'imageSrc': 'assets/images/third.jpg',
      'steps':
          'Let’s look at the types of ListViews there are:\n1. one \n2. two \n3. three'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reading Material',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: elements.length,
        itemBuilder: (context, index) {
          return ReadingElement(elements[index]['title'],
              elements[index]['steps'], elements[index]['imageSrc']);
        },
      ),
    );
  }
}
