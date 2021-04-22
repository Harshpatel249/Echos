import 'package:flutter/material.dart';
class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool visi1 = true;
  bool visi2 = true;
  bool visi3 = true;
  IconData i1 = Icons.visibility;
  IconData i2 = Icons.visibility;
  IconData i3 = Icons.visibility;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: visi1,
              decoration: InputDecoration(
                hintText: "Password",
                labelText: "Enter Current Password",
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                suffixIcon: InkWell(
                  onTap: (){
                    setState(() {
                      visi1 = !visi1;
                      if(visi1) i1 =  Icons.visibility;
                      else i1 =  Icons.visibility_off;
                    });
                  },
                  child: Icon(
                    i1,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: visi2,
              decoration: InputDecoration(
                hintText: "Password",
                labelText: "Enter New Password",
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                suffixIcon: InkWell(
                  onTap: (){
                    setState(() {
                      visi2 = !visi2;
                      if(visi2) i2 =  Icons.visibility;
                      else i2 =  Icons.visibility_off;
                    });
                  },
                  child: Icon(
                    i2,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: visi3,
              decoration: InputDecoration(
                hintText: "Password",
                labelText: "Re-enter New Password",
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                suffixIcon: InkWell(
                  onTap: (){
                    setState(() {
                      visi3 = !visi3;
                      if(visi3) i3 =  Icons.visibility;
                      else i3 =  Icons.visibility_off;
                    });
                  },
                  child: Icon(
                    i3,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          ElevatedButton(
              onPressed: (){},
              child: Text(
                'Save'
              ),
          ),
        ],
      ),
    );
  }
}


