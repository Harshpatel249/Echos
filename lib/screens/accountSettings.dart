import 'package:flutter/material.dart';
import 'package:sign_language_tutor/rewidgets/navBar.dart';
import '../screens/changePassword.dart';
import '../services/personalInformation.dart';
class AccountSettings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AlertDialog dialog = AlertDialog(
      title: Text('Reset settings?'),
      content:
      Text('This will reset your account to its default factory settings. '
          ' All of your progress including your quiz scores will be lost. '
          ' Are you sure you want to continue?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('CANCEL'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('CONTINUE'),
        ),
      ],
    );
    final SimpleDialog ChangePass = SimpleDialog(
      title: Text('Change Password'),
      children: [ChangePassword()],
    );
    final SimpleDialog PersonalInfo = SimpleDialog(
      title: Center(child: Text('Personal Information')),
      children:[PersonalInformation(),]
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
        centerTitle: true,
      ),
      bottomNavigationBar: NavBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LongCard2(
            colour: Colors.black45,
            title: 'Personal Information',
            iconn: Icons.person,
            press: (){
              showDialog<void>(context: context, builder: (context) => PersonalInfo);
            },
          ),
          SizedBox(
            height: 20,
          ),
          LongCard2(
            colour: Colors.black45,
            title: 'Change Password',
            iconn: Icons.lock,
            press: (){
              showDialog<void>(context: context, builder: (context) => ChangePass);
            },
          ),
          SizedBox(
            height: 20,
          ),
          LongCard2(
            colour: Colors.black45,
            title: 'Reset All Progress',
            iconn: Icons.restore,
            press: (){
              showDialog<void>(context: context, builder: (context) => dialog);
            }
          ),
        ],
      ),
    );
  }
}

class LongCard2 extends StatelessWidget {
  LongCard2({
    this.colour,
    this.iconn,
    this.title,
    this.press
  });

  Color colour;
  IconData iconn;
  final title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: colour,

        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 60.0,
            ),
            Icon(
              iconn,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
        onPressed: press,
      ),
    );
  }
}
