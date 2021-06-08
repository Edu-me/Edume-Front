import 'package:edume/models/student_tutor/student_request.dart';
import 'package:edume/ui/pages/student_tutor/prepare_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentRequestCard extends StatefulWidget {
  StudentRequest SR;
  StudentRequestCard({this.SR});
  @override
  _StudentRequestCardState createState() => _StudentRequestCardState();
}

class _StudentRequestCardState extends State<StudentRequestCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
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
                              padding: const EdgeInsets.fromLTRB(0, 15, 30, 0),
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
                                    Text(widget.SR.service.subject.subject),
                              ),
                            ),
                            Padding(
                              padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: new ListTile(
                                leading:
                                    Icon(Icons.school, color: Colors.orange),
                                title: Text("Level"),
                                subtitle: Text(widget.SR.service.level.level),
                              ),
                            ),
                            Padding(
                              padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: new ListTile(
                                leading:
                                    Icon(Icons.school, color: Colors.orange),
                                title: Text("System Language"),
                                subtitle: Text(
                                    widget.SR.service.systemLanguage.language),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      subtitle: Text(widget.SR.sessionType),
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
                                          widget.SR.sessionDuration.toString() +
                                              " " +
                                              "Hours"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Padding(
                                    padding:
                                        new EdgeInsets.fromLTRB(2, 2, 2, 2),
                                    child: new ListTile(
                                      leading: Icon(Icons.calendar_today_sharp,
                                          color: Colors.orange),
                                      title: Text("Day"),
                                      subtitle: Text(widget.SR.day),
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
                                          widget.SR.studentsNum.toString() +
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
                              padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
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
                                    hintText: "Tutor",
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
                                subtitle: Text(widget.SR.tutor.name),
                              ),
                            ),
                            Padding(
                              padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: new ListTile(
                                leading:
                                    Icon(Icons.email, color: Colors.orange),
                                title: Text("Email"),
                                subtitle: Text(widget.SR.tutor.email),
                              ),
                            ),
                            Padding(
                              padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: new ListTile(
                                leading:
                                    Icon(Icons.message, color: Colors.orange),
                                title: Text("Message"),
                                subtitle: Text(widget.SR.message),
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
                              widget.SR.status,
                              style: TextStyle(
                                color: (() {
                                  if (widget.SR.status == "pending")
                                    return Colors.black87;
                                  else if (widget.SR.status == "accepted")
                                    return Colors.green;
                                  else
                                    return Colors.red;
                                })(),
                                fontSize: 40,
                              ),
                            ),
                            (() {
                              if (widget.SR.status == "pending") {
                                return GestureDetector(
                                  onTap: () async {
                                    List<String> availableDays = [];
                                    for (int i = 0;
                                        i < widget.SR.tutor.availability.length;
                                        i++)
                                      availableDays.add(
                                          widget.SR.tutor.availability[i].day);
                                    Get.to(PrepareRequest(
                                      offline: (widget.SR.status == "offline")
                                          ? true
                                          : false,
                                      serviceId: widget.SR.service.id,
                                      tutorId: widget.SR.tutor.id,
                                      days: availableDays,
                                      tutorName: widget.SR.tutor.name,
                                      edit: true,
                                      day: widget.SR.day,
                                      duration:
                                          widget.SR.sessionDuration.toInt(),
                                      message: widget.SR.message,
                                      studentsNumber:
                                          widget.SR.studentsNum.toInt(),
                                      requestID: widget.SR.id,
                                    ));
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                    size: 30,
                                  ),
                                );
                              } else
                                return Text("");
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
    );
  }
}
