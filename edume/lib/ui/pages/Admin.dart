import 'package:edume/shared/auth.dart';
import 'package:edume/ui/pages/register-teacher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'login/login_desktop.dart';
import 'login/login_mobile.dart';
class Admin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    return Scaffold(
        appBar: PreferredSize(

          preferredSize: Size.fromHeight(75.0),
          child: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/logo9.png',
                  fit: BoxFit.contain,
                  height: 40,
                  width: 50,
                ),
                Container(
                    padding: const EdgeInsets.all(8.0), child: Text('Edume'))
              ],
            ),
            backgroundColor: Colors.black,
          ),
        ),
        /////////////////


        ///////////////////
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: deviceType == DeviceScreenType.desktop
                      ? BoxFit.fill
                      : BoxFit.cover)),

          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Welcome Back",
                style: TextStyle(fontSize: deviceType == DeviceScreenType.desktop? 50:30, color: Colors.white),
              ),
            ],
          ),
        ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[

            Container(
              height: 80.0,
              child: DrawerHeader(
                child: Text('Edume',

                    style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 35)
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/register.jpg"),
              ),
              title: Text('Register a tutor'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register_Tutor()),
                );
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/tutor.png"),
              ),
              title: Text('Tutors'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register_Tutor()),
                );
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/students.jpg"),
              ),
              title: Text('Students'),
              onTap: () {
                Navigator.pop(context);
                // ...
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/logout.jpg"),
              ),
              title: Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
                Auth.logout();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenTypeLayout.builder(
                    mobile: (BuildContext context) => Login_Mobile('admin'),
                    desktop: (BuildContext context) => Login_Desktop('admin'),
                  )),
                );
              },
            ),
          ],
        ),

      ),
    ); //scaffold
  }
}
