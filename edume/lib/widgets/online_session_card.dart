import 'package:edume/models/sessions/online_response.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OnlineSessionCard extends StatefulWidget {
  final OnlineSessionResponse session;
  final bool student;
  OnlineSessionCard({this.session, this.student});
  @override
  _OnlineSessionCardState createState() => _OnlineSessionCardState();
}

class _OnlineSessionCardState extends State<OnlineSessionCard> {
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
                                subtitle: Text(
                                    widget.session.service.subject.subject),
                              ),
                            ),
                            Padding(
                              padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: new ListTile(
                                leading:
                                    Icon(Icons.school, color: Colors.orange),
                                title: Text("Level"),
                                subtitle:
                                    Text(widget.session.service.level.level),
                              ),
                            ),
                            Padding(
                              padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: new ListTile(
                                leading:
                                    Icon(Icons.school, color: Colors.orange),
                                title: Text("System Language"),
                                subtitle: Text(widget
                                    .session.service.systemLanguage.language),
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
                                      subtitle: Text("Online"),
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
                                          (widget.session.sessionDuration)
                                                  .toString() +
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
                                      title: Text("Date"),
                                      subtitle: Text(
                                          "${widget.session.day} - ${widget.session.month} - ${DateTime.now().year}"),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Padding(
                                    padding:
                                        new EdgeInsets.fromLTRB(2, 2, 2, 2),
                                    child: new ListTile(
                                      leading: Icon(Icons.calendar_today_sharp,
                                          color: Colors.orange),
                                      title: Text("Time"),
                                      subtitle: Text(
                                          "${widget.session.hour} : ${widget.session.minute}"),
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
                                    hintText:
                                        widget.student ? "Student" : "Tutor",
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
                                subtitle: widget.student
                                    ? Text(widget.session.student.name)
                                    : Text(widget.session.tutor.name),
                              ),
                            ),
                            Padding(
                              padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: new ListTile(
                                leading:
                                    Icon(Icons.email, color: Colors.orange),
                                title: Text("Email"),
                                subtitle: widget.student
                                    ? Text(widget.session.student.email)
                                    : Text(widget.session.tutor.email),
                              ),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            SizedBox(
                              width: 200,
                              child: Padding(
                                padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                                child: new ListTile(
                                  leading: Icon(Icons.supervisor_account_sharp,
                                      color: Colors.orange),
                                  title: Text("Students"),
                                  subtitle: Text(
                                      widget.session.studentsNum.toString() +
                                          " " +
                                          "Students"),
                                ),
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
                            RichText(
                              text: new TextSpan(
                                children: [
                                  new TextSpan(
                                    text: "${widget.session.sessionTitle}",
                                    style: new TextStyle(color: Colors.black),
                                  ),
                                  new TextSpan(
                                    text: 'Scheduled zoom meeting link',
                                    style: new TextStyle(color: Colors.blue),
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () {
                                        launch(widget.session.zoomMeeting);
                                      },
                                  ),
                                ],
                              ),
                            ),
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
