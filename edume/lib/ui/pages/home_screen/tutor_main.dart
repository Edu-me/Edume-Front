import 'dart:convert';

import 'package:edume/shared/auth.dart';
import 'package:edume/shared/tutor-service.dart';
import 'package:edume/ui/pages/login/login_desktop.dart';
import 'package:edume/ui/pages/login/login_mobile.dart';
import 'package:edume/ui/pages/student_main/student_main.dart';
import 'package:edume/ui/pages/tutor/tutor-services-ui.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;



class tutor_main extends StatefulWidget {



  @override
  _tutor_mainState createState() => _tutor_mainState();
}

class _tutor_mainState extends State<tutor_main> {
  List<Tutor_Service> myservices = [];


   Future<bool> GetServices() async {
    final SharedPreferences shPr = await SharedPreferences.getInstance();

    final String apiUrl = "http://localhost:3000/Edume/v1/tutor/services/"+ shPr.getString("id");
    final response = await http.get(apiUrl,
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': shPr.getString("token"),

        });
    if (response.statusCode == 200) {
      for (int i = 0; i < (jsonDecode(response.body)).length; i++) {
        Tutor_Service service = new Tutor_Service();
        service.availability = ((jsonDecode(response.body))[i])["availability"];
        service.rating = ((jsonDecode(response.body))[i])["rating"];
        service.locations = ((jsonDecode(response.body))[i])["locations"].cast<String>();
        service.service = new Service();
        service.service.sId = ((jsonDecode(response.body))[i])["service"]["_id"];
        service.service.subject = new Subject();
        service.service.subject.sId = ((jsonDecode(response.body))[i])["service"]["subject"]["_id"];
        service.service.subject.subject = ((jsonDecode(response.body))[i])["service"]["subject"]["subject"];
        service.service.level = new Level();
        service.service.level.sId = ((jsonDecode(response.body))[i])["service"]["level"]["_id"];
        service.service.level.level = ((jsonDecode(response.body))[i])["service"]["level"]["level"];

        service.service.systemLanguage = new SystemLanguage();
        service.service.systemLanguage.sId = ((jsonDecode(response.body))[i])["service"]["systemLanguage"]["_id"];
        service.service.systemLanguage.language = ((jsonDecode(response.body))[i])["service"]["systemLanguage"]["language"];

        service.mode = ((jsonDecode(response.body))[i])["mode"];
        myservices.add(service);

      }
      return true;
    } else
      return false;
  }
  @override
  Widget build(BuildContext context) {
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(width: 120.0, height: 100.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome, ",
                    style: TextStyle(fontSize: 30, color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: RaisedButton.icon(
                      elevation: 4.0,
                      icon: Image.asset(
                        'assets/profile.jpg',
                        width: 100,
                        height: 70,
                      ),
                      color: Colors.transparent,
                      onPressed: () {},
                      label: Text("Profile",
                          style:
                          TextStyle(color: Colors.white, fontSize: 30.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: RaisedButton.icon(
                        elevation: 4.0,
                        icon: Image.asset(
                          'assets/service.jpg',
                          width: 100,
                          height: 70,
                        ),
                        color: Colors.transparent,
                        onPressed: () async{
                          await GetServices();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Tutor_Services(myservices)),
                          );
                        },
                        label: Text("Services",
                            style: TextStyle(
                                color: Colors.white, fontSize: 30.0))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: RaisedButton.icon(
                        elevation: 4.0,
                        icon: Image.asset(
                          'assets/service.jpg',
                          width: 100,
                          height: 70,
                        ),
                        color: Colors.transparent,
                        onPressed: () {},
                        label: Text("Requests",
                            style: TextStyle(
                                color: Colors.white, fontSize: 30.0))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: RaisedButton.icon(
                        elevation: 4.0,
                        icon: Image.asset(
                          'assets/service.jpg',
                          width: 100,
                          height: 60,
                        ),
                        color: Colors.transparent,
                        onPressed: () {
                          Navigator.pop(context);
                          Auth.logout();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ScreenTypeLayout.builder(
                              mobile: (BuildContext context) => Login_Mobile('tutor'),
                              desktop: (BuildContext context) => Login_Desktop('tutor'),
                            )),
                          );
                        },
                        label: Text("LogOut",
                            style: TextStyle(
                                color: Colors.white, fontSize: 30.0))),
                  ),
                ),
                // ignore: deprecated_member_use

              ],
            ),
          ],
        ),
      ),

      /////////////////
    );
  }
}
