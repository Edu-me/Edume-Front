import 'package:edume/main.dart';
import 'package:edume/ui/pages/login/login_desktop.dart';
import 'package:edume/ui/pages/login/login_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text("logout"),
        onPressed:() async{
          final SharedPreferences shPr = await SharedPreferences.getInstance();
          shPr.remove("token");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScreenTypeLayout.builder(
              mobile: (BuildContext context) => Login_Mobile('student'),
              desktop: (BuildContext context) => Login_Desktop('student'),
            )),
          );
        },
      ),
    );
  }
}
