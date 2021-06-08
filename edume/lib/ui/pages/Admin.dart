import 'dart:convert';

import 'package:edume/shared/admin-tutor.dart';
import 'package:edume/shared/auth.dart';
import 'package:edume/ui/pages/register-teacher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'admin-view-tutors.dart';
import 'login/login_desktop.dart';
import 'login/login_mobile.dart';
class Admin extends StatefulWidget {

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  List<Admin_Tutor> systemtutors = [];
  Future<bool> GetSystemTutors() async {
    systemtutors = [];
    final String apiUrl = "http://localhost:3000/Edume/v1/admin/getTutors";
    final SharedPreferences shPr =
    await SharedPreferences.getInstance();
    final response = await http.get(apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': shPr.getString("token"),
      },
    );

    if (response.statusCode == 200) {
      for (int i = 0; i < (jsonDecode(response.body)).length; i++) {
        print((jsonDecode(response.body))[i]);
        Admin_Tutor tutor = new Admin_Tutor();
        tutor.sId = ((jsonDecode(response.body))[i])["_id"];
        tutor.about = ((jsonDecode(response.body))[i])["about"];
        tutor.email = ((jsonDecode(response.body))[i])["email"];
        tutor.name = ((jsonDecode(response.body))[i])["name"];
        tutor.phoneNumber = ((jsonDecode(response.body))[i])["phoneNumber"];
        tutor.nationality = ((jsonDecode(response.body))[i])["nationality"];
        List<Availability> available = [];
        for(int j=0; j<(jsonDecode(response.body))[i]["availability"].length; j++){
          Availability v = new Availability();
          v.availabe = (jsonDecode(response.body))[i]["availability"][j]["availabe"];
          v.sId = (jsonDecode(response.body))[i]["availability"][j]["_id"];
          v.day = (jsonDecode(response.body))[i]["availability"][j]["day"];
          available.add(v);
        }
        tutor.availability = available;
        systemtutors.add(tutor);
      }
      return true;
    } else
      return false;
  }

  bool showReload = false;
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
        body: Builder(
        builder: (context) {
          return ModalProgressHUD(
        inAsyncCall: showReload,
        opacity: 0,
        progressIndicator: CircularProgressIndicator(),
        child: Container(
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
          );
        },/////////////////
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
              onTap: () async{
                Navigator.pop(context);
                setState(() {
                  showReload = true;
                });
                await GetSystemTutors();
                setState(() {
                  showReload = false;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Admin_View_Tutor(systemtutors)),
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
                backgroundImage: AssetImage("assets/logout.png"),
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
