import 'package:flutter/material.dart';

class DifficultyPage extends StatelessWidget {
  static String id = 'difficulty_page';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Choose Lesson difficulty',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  print('Easy difficulty');
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage('images/easy.gif'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  print('Intermediate difficulty');
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage('images/easy.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  print('Expert difficulty');
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage('images/easy.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
