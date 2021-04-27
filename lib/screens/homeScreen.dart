import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../rewidgets/navBar.dart';
import 'loginPage.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home_page';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // child: Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: Alignment.bottomLeft,
      //         end: Alignment.topRight,
      //         colors: [Colors.black, Colors.blue]),
      //   ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: NavBar(
          id: HomeScreen.id,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Tutorials',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        width: 200,
                        child: Card(// with Material
                          child:
                          Image.asset(
                            'images/Tutorial.png',
                          ),
                          elevation: 18.0,
                          clipBehavior: Clip.antiAlias,
                          color: Color(0xFFd3b4b3),
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Translate',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        width: 200,
                        child: Card(// with Material
                          child:
                          Image.asset(
                            'images/LogoEchoes.png',
                          ),
                          elevation: 18.0,
                          clipBehavior: Clip.antiAlias,
                          color: Color(0xFFf7f3e9),
                        ),
                      ),
                    ),
                    onTap: (){},
                  ),
                ],
              ),
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
