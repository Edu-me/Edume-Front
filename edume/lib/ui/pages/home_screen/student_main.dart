import 'dart:convert';
import 'package:edume/controllers/student_tutor/services_controller.dart';
import 'package:edume/main.dart';
import 'package:edume/models/student_tutor/service_model.dart';
import 'package:edume/models/student_tutor/student_request.dart' as SD;
import 'package:edume/networking/sessions.dart';
import 'package:edume/networking/student_tutor/add_request_services.dart';
import 'package:edume/shared/auth.dart';
import 'package:edume/shared/tutor_request.dart';
import 'package:edume/ui/pages/login/login_desktop.dart';
import 'package:edume/ui/pages/login/login_mobile.dart';
import 'package:edume/ui/pages/student/student_profile.dart';
import 'package:edume/ui/pages/student_tutor/sessions.dart';
import 'package:edume/ui/pages/student_tutor/set_tutor_selectors.dart';
import 'package:edume/ui/pages/student_tutor/track_requests.dart';
import 'package:edume/widgets/service_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

ServiceController serviceController = Get.put(ServiceController());

class student_main extends StatefulWidget {
  @override
  _student_mainState createState() => _student_mainState();
}

class _student_mainState extends State<student_main> {
  List<ServiceCard> servicesCards = [];
  Student info = new Student();
  bool showReload = false;

  Future<List<ServiceCard>> getServices(bool offline) async {
    List<Service> services = await serviceController.getServices();

    for (int i = 0; i < services.length; i++) {
      ServiceCard serviceCard = new ServiceCard(
          offline: offline,
          id: (services)[i].id,
          serviceName: (services)[i].subject.subject,
          level: services[i].level.level,
          systemLanguage: (services)[i].systemLanguage.language);
      servicesCards.add(serviceCard);
    }
    return servicesCards;
  }

  /////////////get student
  Future<bool> GetStudentInfo() async {
    final SharedPreferences shPr = await SharedPreferences.getInstance();
    final String apiUrl =
        "http://localhost:3000/Edume/v1/student/" + shPr.getString("id");
    final response = await http.get(apiUrl, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      info.sId = ((jsonDecode(response.body)))["_id"];
      info.name = ((jsonDecode(response.body)))["name"];
      info.phoneNumber = ((jsonDecode(response.body)))["phoneNumber"];
      info.email = ((jsonDecode(response.body)))["email"];

      print((jsonDecode(response.body)));
      return true;
    } else {
      return false;
    }
  }

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
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Edume'))
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
                        onPressed: () {
                          Navigator.pop(context);
                          Auth.logout();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScreenTypeLayout.builder(
                                      mobile: (BuildContext context) =>
                                          MyHomePage(title: 'Edume'),
                                      desktop: (BuildContext context) =>
                                          MyHomePage(title: 'Edume'),
                                    )),
                          );
                        },
                        label: Text("Logout",
                            style:
                                TextStyle(color: Colors.white, fontSize: 21))),
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
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 200.0, height: 100.0),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 60, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: RaisedButton.icon(
                                  elevation: 4.0,
                                  icon: Icon(
                                    Icons.home_repair_service,
                                    size: 100,
                                    color: Colors.white,
                                  ),
                                  color: Colors.transparent,
                                  onPressed: () async {
                                    setState(() {
                                      showReload = true;
                                    });
                                    List<ServiceCard> services =
                                        await getServices(true);
                                    setState(() {
                                      showReload = false;
                                    });
                                    Get.to(SetTutorSelectors(
                                      offline: true,
                                      all_services: services,
                                    ));
                                  },
                                  label: Text("Tutors",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30.0)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: RaisedButton.icon(
                                    elevation: 4.0,
                                    icon: Icon(
                                      Icons.wifi_outlined,
                                      size: 100,
                                      color: Colors.white,
                                    ),
                                    color: Colors.transparent,
                                    onPressed: () async {
                                      setState(() {
                                        showReload = true;
                                      });
                                      List<ServiceCard> services =
                                          await getServices(false);
                                      setState(() {
                                        showReload = false;
                                      });
                                      Get.to(SetTutorSelectors(
                                        offline: false,
                                        all_services: services,
                                      ));
                                    },
                                    label: Text("Online Tutors",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30.0))),
                              ),
                            ),
                            // ignore: deprecated_member_use
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: RaisedButton.icon(
                                    elevation: 4.0,
                                    icon: Icon(
                                      Icons.person,
                                      size: 100,
                                      color: Colors.white,
                                    ),
                                    color: Colors.transparent,
                                    onPressed: () async {
                                      setState(() {
                                        showReload = true;
                                      });
                                      await GetStudentInfo();
                                      setState(() {
                                        showReload = false;
                                      });
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Student_Profile(info)),
                                      );
                                    },
                                    label: Text("Profile",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30.0))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: RaisedButton.icon(
                                  elevation: 4.0,
                                  icon: Icon(
                                    Icons.date_range,
                                    size: 100,
                                    color: Colors.white,
                                  ),
                                  color: Colors.transparent,
                                  onPressed: () async {
                                    Sessions sessionsServices = new Sessions();
                                    List<List<dynamic>> sessions =
                                        await sessionsServices.getSessions();
                                    if (sessions != [] && sessions != null) {
                                      Get.to(SessionPage(
                                        offline: sessions[1],
                                        online: sessions[0],
                                        student: false,
                                      ));
                                    } else if (sessions == [])
                                      Get.snackbar("There's no sessions Coming",
                                          "Send some requests !");
                                  },
                                  label: Text("Sessions",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(160.0),
                          child: Column(
                            children: [
                              Text("Who are You looking for today? ",
                                  style: TextStyle(
                                      fontSize: 60, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }, /////////////////
        )
        /////////////////
        );
  }
}
/*                                  Sessions sessionsServices = new Sessions();
                                  List<List<dynamic>> sessions =
                                      await sessionsServices.getSessions();
                                  if (sessions != [] && sessions != null) {
                                    Get.to(SessionPage(
                                      offline: sessions[1],
                                      online: sessions[0],
                                      student: false,
                                    ));
                                  } else if (sessions == [])
                                    Get.snackbar("There's no sessions Coming",
                                        "Accept some requests");*/
