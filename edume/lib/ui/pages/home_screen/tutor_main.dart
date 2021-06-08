import 'dart:convert';

import 'package:edume/shared/auth.dart';
import 'package:edume/shared/tutor-service.dart';
import 'package:edume/shared/tutor_request.dart';
import 'package:edume/ui/pages/login/login_desktop.dart';
import 'package:edume/ui/pages/login/login_mobile.dart';
import 'package:edume/ui/pages/tutor/tutor-services-ui.dart';
import 'package:edume/ui/pages/tutor/tutor_profile.dart';
import 'package:edume/ui/pages/tutor/tutor_requests.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;



class tutor_main extends StatefulWidget {



  @override
  _tutor_mainState createState() => _tutor_mainState();
}

class _tutor_mainState extends State<tutor_main> {
  List<Tutor_Service> myservices = [];
  List<Tutor_Request> myrequests = [];

   Future<bool> GetServices() async {
     myservices=[];
    final SharedPreferences shPr = await SharedPreferences.getInstance();

    final String apiUrl = "http://localhost:3000/Edume/v1/tutor/services/"+ shPr.getString("id");
    final response = await http.get(apiUrl,
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': shPr.getString("token"),
        },
    );
    print(shPr.getString("id"));
    print(response.body);
    if (response.statusCode == 200) {
      for (int i = 0; i < (jsonDecode(response.body)).length; i++) {
        Tutor_Service service = new Tutor_Service();
        service.sId = ((jsonDecode(response.body))[i])["_id"];
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
  /////////////////////////////list of requests
  Future<bool> GetRequests() async {
    myrequests = [];
    final SharedPreferences shPr = await SharedPreferences.getInstance();
    final String apiUrl = "http://localhost:3000/Edume/v1/request/tutor";
    final response = await http.get(apiUrl,
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': shPr.getString("token"),
        });
    print((jsonDecode(response.body)));
    if (response.statusCode == 200) {
      for (int i = 0; i < (jsonDecode(response.body)).length; i++) {
        Tutor_Request request = new Tutor_Request();
        request.sId = ((jsonDecode(response.body))[i])["_id"];
        request.message = ((jsonDecode(response.body))[i])["message"];
        request.status = ((jsonDecode(response.body))[i])["status"];

        request.student = new Student();
        request.student.sId = ((jsonDecode(response.body))[i])["student"]["_id"];
        request.student.email =  ((jsonDecode(response.body))[i])["student"]["email"];
        request.student.name =  ((jsonDecode(response.body))[i])["student"]["name"];
        request.student.phoneNumber =  ((jsonDecode(response.body))[i])["student"]["phoneNumber"];

        request.service = new Service();
        request.service.sId = ((jsonDecode(response.body))[i])["service"]["_id"];
        request.service.subject = new Subject();
        request.service.subject.sId = ((jsonDecode(response.body))[i])["service"]["subject"]["_id"];
        request.service.subject.subject = ((jsonDecode(response.body))[i])["service"]["subject"]["subject"];
        request.service.level = new Level();
        request.service.level.sId = ((jsonDecode(response.body))[i])["service"]["level"]["_id"];
        request.service.level.level = ((jsonDecode(response.body))[i])["service"]["level"]["level"];
        request.service.systemLanguage = new SystemLanguage();
        request.service.systemLanguage.sId = ((jsonDecode(response.body))[i])["service"]["systemLanguage"]["_id"];
        request.service.systemLanguage.language = ((jsonDecode(response.body))[i])["service"]["systemLanguage"]["language"];

        request.sessionType = ((jsonDecode(response.body))[i])["sessionType"];
        request.sessionDuration = ((jsonDecode(response.body))[i])["sessionDuration"];
        request.studentsNum = ((jsonDecode(response.body))[i])["studentsNum"];
        request.day = ((jsonDecode(response.body))[i])["day"];
        myrequests.add(request);

      }
      return true;
    } else
      return false;
  }
  bool showReload = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 20, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: RaisedButton.icon(
                      icon: Icon(
                        Icons.logout,
                        size: 20,
                      ),
                      color: Colors.orange,
                      onPressed: ()  {
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
                      label: Text("Logout",
                          style: TextStyle(color: Colors.white, fontSize: 21))),
                ),
              ),

            ],

          ),

          backgroundColor: Colors.black,
        ),
      ),
      /////////////////
      body: Builder(
        builder: (context) {
        return ModalProgressHUD(
        inAsyncCall: showReload,
          opacity: 0,
          progressIndicator: CircularProgressIndicator(),
         child: Container(
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
                Text("Welcome!",
                    style: TextStyle(fontSize: 30, color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: RaisedButton.icon(
                      elevation: 4.0,
                      icon: Icon(Icons.person, size: 100,),
                      color: Colors.orange.withOpacity(0.5),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => tutor_profile()),
                        );
                      },
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
                        icon: Icon(Icons.home_repair_service, size: 100,),
                        color: Colors.orange.withOpacity(0.5),
                        onPressed: () async{
                          setState(() {
                            showReload = true;
                          });
                          await GetServices();
                          setState(() {
                            showReload = false;
                          });
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
                        icon: Icon(Icons.send, size: 100,),
                        color: Colors.orange.withOpacity(0.5),

                        onPressed: () async{
                          setState(() {
                            showReload = true;
                          });
                          await GetRequests();
                          setState(() {
                            showReload = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Tutor_Requests(myrequests)),
                          );
                        },
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
                        icon: Icon(Icons.event_note_sharp, size: 100,),
                        color: Colors.orange.withOpacity(0.5),
                        onPressed: () {

                        },
                        label: Text("Sessions",
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
    );
    },/////////////////
    )
    );
  }
}
