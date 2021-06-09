import 'dart:html';
import 'package:edume/models/sessions/offline_session.dart';
import 'package:edume/models/sessions/online_session.dart';
import 'package:edume/networking/sessions.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'dart:convert';
import 'package:date_utils/date_utils.dart';
import 'package:edume/shared/tutor_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Tutor_Requests extends StatefulWidget {
  final List<Tutor_Request> myrequests;
  Tutor_Requests(this.myrequests);
  @override
  _Tutor_RequestsState createState() => _Tutor_RequestsState(myrequests);
}

class _Tutor_RequestsState extends State<Tutor_Requests> {
  final List<Tutor_Request> myrequests;

  _Tutor_RequestsState(this.myrequests);

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
                      padding: const EdgeInsets.all(8.0), child: Text('Edume')),
                ],
              ),
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
                image: AssetImage("assets/background.jpg"), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (() {
                if (myrequests.length == 0) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                        child: Text(
                          "No requests yet!",
                          style: TextStyle(fontSize: 50, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                        child: Container(
                          child: new Image.asset(
                            'assets/notfound.png',
                            height: 300.0,
                            width: 300,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  );
                } else
                  return new ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: new List.generate(myrequests.length,
                        (i) => new TutorRequestCard(myrequests[i])),
                  );
              })(),
            ],
          ),
        ),
      ),

      /////////////////
    );
  }
}

class TutorRequestCard extends StatefulWidget {
  Tutor_Request TR;
  TutorRequestCard(this.TR);
  @override
  _TutorRequestCardState createState() => _TutorRequestCardState();
}

class _TutorRequestCardState extends State<TutorRequestCard> {
  List<String> locations = [
    "Giza",
    "Cairo",
    "Alexandria",
    "Luxor",
    "Aswan",
    "Faiyum",
    "Ismailia",
    "Minya"
  ];
  String location;
  List<DropdownMenuItem> items = [];
  @override
  void initState() {
    location = locations[0];
    for (int i = 0; i < locations.length; i++) {
      DropdownMenuItem item = new DropdownMenuItem(
        child: Text(locations[i]),
        onTap: () {
          setState(() {
            location = locations[i];
          });
        },
        value: locations[i],
      );
      items.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
        child: Card(
          color: Colors.white,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {},
            child: new SizedBox(
              width: 800,
              height: 550,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 800,
                    height: 450,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 400,
                          child: Column(
                            //for session info
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 15, 30, 0),
                                child: TextField(
                                  decoration: new InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(30.0),
                                        ),
                                      ),
                                      filled: true,
                                      enabled: false,
                                      hintStyle:
                                          new TextStyle(color: Colors.black),
                                      hintText: "Session",
                                      fillColor: Colors.white54),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: new EdgeInsets.fromLTRB(2, 15, 2, 2),
                                child: new ListTile(
                                  leading: Icon(
                                    Icons.school,
                                    color: Colors.orange,
                                  ),
                                  title: Text("Subject"),
                                  subtitle:
                                      Text(widget.TR.service.subject.subject),
                                ),
                              ),
                              Padding(
                                padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                                child: new ListTile(
                                  leading:
                                      Icon(Icons.school, color: Colors.orange),
                                  title: Text("Level"),
                                  subtitle: Text(widget.TR.service.level.level),
                                ),
                              ),
                              Padding(
                                padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                                child: new ListTile(
                                  leading:
                                      Icon(Icons.school, color: Colors.orange),
                                  title: Text("System Language"),
                                  subtitle: Text(widget
                                      .TR.service.systemLanguage.language),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: Padding(
                                      padding:
                                          new EdgeInsets.fromLTRB(2, 2, 2, 2),
                                      child: new ListTile(
                                        leading: Icon(Icons.info,
                                            color: Colors.orange),
                                        title: Text("Type"),
                                        subtitle: Text(widget.TR.sessionType),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Padding(
                                      padding:
                                          new EdgeInsets.fromLTRB(2, 2, 2, 2),
                                      child: new ListTile(
                                        leading: Icon(Icons.timer_sharp,
                                            color: Colors.orange),
                                        title: Text("Duration"),
                                        subtitle: Text(
                                            (widget.TR.sessionDuration)
                                                    .toString() +
                                                " " +
                                                "Hours"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: Padding(
                                      padding:
                                          new EdgeInsets.fromLTRB(2, 2, 2, 2),
                                      child: new ListTile(
                                        leading: Icon(
                                            Icons.calendar_today_sharp,
                                            color: Colors.orange),
                                        title: Text("Day"),
                                        subtitle: Text(widget.TR.day),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Padding(
                                      padding:
                                          new EdgeInsets.fromLTRB(2, 2, 2, 2),
                                      child: new ListTile(
                                        leading: Icon(
                                            Icons.supervisor_account_sharp,
                                            color: Colors.orange),
                                        title: Text("Students"),
                                        subtitle: Text(
                                            widget.TR.studentsNum.toString() +
                                                " " +
                                                "Students"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(
                          thickness: 2,
                        ),
                        SizedBox(
                          width: 200,
                          child: Column(
                            //for session info
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 15, 0, 0),
                                child: TextField(
                                  decoration: new InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(30.0),
                                        ),
                                      ),
                                      filled: true,
                                      enabled: false,
                                      hintStyle:
                                          new TextStyle(color: Colors.black),
                                      hintText: "Student",
                                      fillColor: Colors.white54),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: new EdgeInsets.fromLTRB(2, 15, 2, 2),
                                child: new ListTile(
                                  leading: Icon(
                                    Icons.person,
                                    color: Colors.orange,
                                  ),
                                  title: Text("Name"),
                                  subtitle: Text(widget.TR.student.name),
                                ),
                              ),
                              Padding(
                                padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                                child: new ListTile(
                                  leading:
                                      Icon(Icons.email, color: Colors.orange),
                                  title: Text("Email"),
                                  subtitle: Text(widget.TR.student.email),
                                ),
                              ),
                              Padding(
                                padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                                child: new ListTile(
                                  leading: Icon(Icons.phone_android,
                                      color: Colors.orange),
                                  title: Text("Phone Number"),
                                  subtitle: Text(widget.TR.student.phoneNumber),
                                ),
                              ),
                              Padding(
                                padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                                child: new ListTile(
                                  leading:
                                      Icon(Icons.message, color: Colors.orange),
                                  title: Text("Message"),
                                  subtitle: Text(widget.TR.message),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: 800,
                      height: 100,
                      child: InkWell(
                        child: Container(
                          width: 800,
                          height: 100,
                          color: Colors.black26,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.TR.status,
                                style: TextStyle(
                                  color: (() {
                                    if (widget.TR.status == "pending")
                                      return Colors.black87;
                                    else if (widget.TR.status == "accepted")
                                      return Colors.green;
                                    else
                                      return Colors.red;
                                  })(),
                                  fontSize: 40,
                                ),
                              ),
                              (() {
                                if (widget.TR.status != "pending") {
                                  return Text("");
                                } else
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                          child: Text(
                                            'Accept',
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.green),
                                          ),
                                          onPressed: () async {
                                            final DateTime date = new DateTime(
                                                DateTime.now().year,
                                                DateTime.now().month);
                                            final DateTime lastDay =
                                                Utils.lastDayOfMonth(date);
                                            int daysOfTheMonth = lastDay.day;
                                            DateTime dateV;
                                            DatePicker.showDateTimePicker(
                                                context,
                                                showTitleActions: true,
                                                minTime: DateTime(
                                                    DateTime.now().year,
                                                    DateTime.now().month,
                                                    DateTime.now().day,
                                                    DateTime.now().hour + 1,
                                                    DateTime.now().minute),
                                                maxTime: DateTime(
                                                    DateTime.now().year,
                                                    12,
                                                    daysOfTheMonth,
                                                    23,
                                                    59),
                                                onConfirm: (date) async {
                                              setState(() {
                                                dateV = date;
                                              });
                                              print('confirm ${date}');
                                              final SharedPreferences shPr =
                                                  await SharedPreferences
                                                      .getInstance();
                                              final String apiUrl =
                                                  "http://localhost:3000/Edume/v1/request/status/" +
                                                      widget.TR.sId;

                                              if (widget.TR.sessionType ==
                                                  "offline") {
                                                print(
                                                    "hahahaha------------------");
                                                //check the location

                                                return showDialog<void>(
                                                    context: context,
                                                    barrierDismissible:
                                                        false, // user must tap button!
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Please Choose session location'),
                                                        content:
                                                            SingleChildScrollView(
                                                                child:
                                                                    DropdownButton(
                                                          items: items,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              location = value;
                                                            });
                                                          },
                                                          value: location,
                                                        )),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            child: const Text(
                                                                'Confirm'),
                                                            onPressed:
                                                                () async {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              final response =
                                                                  await http.put(
                                                                      apiUrl,
                                                                      headers: <
                                                                          String,
                                                                          String>{
                                                                        'Content-Type':
                                                                            'application/json; charset=UTF-8',
                                                                        'x-auth-token':
                                                                            shPr.getString("token"),
                                                                      },
                                                                      body:
                                                                          jsonEncode({
                                                                        "status":
                                                                            "accepted",
                                                                      }));
                                                              if (response
                                                                      .statusCode ==
                                                                  200) {
                                                                OfflineSession offlineSession = new OfflineSession(
                                                                    day: dateV.day.toString().length < 2
                                                                        ? "0${dateV.day.toString()}"
                                                                        : dateV.day
                                                                            .toString(),
                                                                    hour: dateV.hour.toString().length < 2
                                                                        ? "0${dateV.hour.toString()}"
                                                                        : dateV
                                                                            .hour
                                                                            .toString(),
                                                                    month: dateV.month.toString().length < 2
                                                                        ? "0${dateV.month.toString()}"
                                                                        : dateV
                                                                            .month
                                                                            .toString(),
                                                                    minute: dateV.minute.toString().length < 2
                                                                        ? "0${dateV.minute.toString()}"
                                                                        : dateV
                                                                            .minute
                                                                            .toString(),
                                                                    service: widget
                                                                        .TR
                                                                        .service
                                                                        .sId,
                                                                    sessionDuration:
                                                                        widget.TR.sessionDuration * 60,
                                                                    student: widget.TR.student.sId,
                                                                    studentsNum: widget.TR.studentsNum,
                                                                    location: location);
                                                                Sessions
                                                                    sessionServices =
                                                                    new Sessions();
                                                                await sessionServices
                                                                    .submitOfflineSession(
                                                                        offlineSession);
                                                              }
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    });

                                                ///------------------------ send request to offline session
                                              } else {
                                                final response = await http.put(
                                                    apiUrl,
                                                    headers: <String, String>{
                                                      'Content-Type':
                                                          'application/json; charset=UTF-8',
                                                      'x-auth-token': shPr
                                                          .getString("token"),
                                                    },
                                                    body: jsonEncode({
                                                      "status": "accepted",
                                                    }));
                                                if (response.statusCode ==
                                                    200) {
                                                  ///------------------------ send request to online session
                                                  OnlineSession onlineSession =
                                                      new OnlineSession(
                                                    day: dateV.day
                                                                .toString()
                                                                .length <
                                                            2
                                                        ? "0${dateV.day.toString()}"
                                                        : dateV.day.toString(),
                                                    hour: dateV.hour
                                                                .toString()
                                                                .length <
                                                            2
                                                        ? "0${dateV.hour.toString()}"
                                                        : dateV.hour.toString(),
                                                    month: dateV.month
                                                                .toString()
                                                                .length <
                                                            2
                                                        ? "0${dateV.month.toString()}"
                                                        : dateV.month
                                                            .toString(),
                                                    minute: dateV.minute
                                                                .toString()
                                                                .length <
                                                            2
                                                        ? "0${dateV.minute.toString()}"
                                                        : dateV.minute
                                                            .toString(),
                                                    service:
                                                        widget.TR.service.sId,
                                                    sessionDuration: widget.TR
                                                            .sessionDuration *
                                                        60,
                                                    student:
                                                        widget.TR.student.sId,
                                                    studentsNum:
                                                        widget.TR.studentsNum,
                                                  );
                                                  Sessions sessionServices =
                                                      new Sessions();
                                                  await sessionServices
                                                      .submitOnlineSession(
                                                          onlineSession);
                                                }
                                              }
                                            }, locale: LocaleType.en);
                                          }),
                                      TextButton(
                                          child: Text(
                                            'Decline',
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.red),
                                          ),
                                          onPressed: () async {
                                            final SharedPreferences shPr =
                                                await SharedPreferences
                                                    .getInstance();

                                            final String apiUrl =
                                                "http://localhost:3000/Edume/v1/request/status/" +
                                                    widget.TR.sId;
                                            final response =
                                                await http.put(apiUrl,
                                                    headers: <String, String>{
                                                      'Content-Type':
                                                          'application/json; charset=UTF-8',
                                                      'x-auth-token': shPr
                                                          .getString("token"),
                                                    },
                                                    body: jsonEncode({
                                                      "status": "refused",
                                                    }));
                                          }),
                                    ],
                                  );
                              })(),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
