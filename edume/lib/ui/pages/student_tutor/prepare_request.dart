import 'package:edume/controllers/student_tutor/send_request_controller.dart';
import 'package:edume/models/student_tutor/add_request.dart';
import 'package:edume/models/student_tutor/edit_request.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrepareRequest extends StatefulWidget {
  final bool offline;
  final String tutorId, tutorName;
  final String serviceId;
  final List<String> days;
  final bool edit;
  final int duration;
  final String day;
  final int studentsNumber;
  final String message;
  final String requestID;
  PrepareRequest(
      {this.offline,
      this.tutorId,
      this.serviceId,
      this.days,
      this.tutorName,
      this.edit,
      this.duration,
      this.day,
      this.message,
      this.studentsNumber,
      this.requestID});
  @override
  _PrepareRequestState createState() => _PrepareRequestState();
}

class _PrepareRequestState extends State<PrepareRequest> {
  int duration = 1;
  String day;
  int studentsNumber = 1;
  String message = "";
  List<DropdownMenuItem> daysItems = [];
  TextEditingController messageController;
  bool available = true;

  @override
  void initState() {
    if (widget.days.length == 0)
      available = false;
    else {
      if (widget.edit) {
        day = widget.day;
        duration = widget.duration ~/ 60;
        studentsNumber = widget.studentsNumber;
        message = widget.message;
        messageController = TextEditingController(text: widget.message);
      } else {
        day = widget.days[0];
      }
      for (int i = 0; i < widget.days.length; i++) {
        DropdownMenuItem dayItem = new DropdownMenuItem(
          child: Text(
            widget.days[i],
            style: TextStyle(color: Colors.orange, fontSize: 15),
          ),
          onTap: () {
            setState(() {
              day = widget.days[i];
            });
          },
          value: widget.days[i],
        );
        daysItems.add(dayItem);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade900,
        title: Text("Sending Session Request To ${widget.tutorName}"),
        centerTitle: true,
      ),
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100.0, 100.0, 100.0, 20),
            child: available
                ? SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 50.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "Students Number: ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (studentsNumber > 1) studentsNumber--;
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    size: 20,
                                    color: Colors.orange,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                ),
                              ),
                              //----------------------------------
                              Text(
                                studentsNumber.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),

                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (studentsNumber < 5) studentsNumber++;
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Colors.orange,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //----------------------------------------------------------------------
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "Session Duration:  ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (duration > 1) duration--;
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    size: 20,
                                    color: Colors.orange,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                ),
                              ),
                              //----------------------------------
                              Text(
                                duration.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (duration < 3) duration++;
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Colors.orange,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                ),
                              ),
                            ],
                          ),
                          //--------------------------------------------------------------------------------------------------------------
                          SizedBox(
                            height: 20,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Day: ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              DropdownButton(
                                items: daysItems,
                                dropdownColor: Colors.white,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.orange,
                                ),
                                value: day,
                                onChanged: (value) {
                                  setState(() {
                                    day = value;
                                  });
                                },
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: TextField(
                              enabled: !widget.edit,
                              controller: messageController,
                              onChanged: (value) {
                                setState(() {
                                  message = value;
                                });
                              },
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                errorBorder: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.7),
                                  borderSide: new BorderSide(
                                      color: Colors.orange, width: 0.0),
                                ),
                                hintText: "Message to the tutor",
                                fillColor: Colors.grey.shade300,
                                filled: true,
                                border: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.7),
                                    borderSide: new BorderSide(
                                        width: 0.0, style: BorderStyle.none)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.7),
                                    borderSide: new BorderSide(
                                        width: 0.0, style: BorderStyle.none)),
                                contentPadding:
                                    EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                              ),
                            ),

                            //------------------------------------------------------------------
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: RaisedButton.icon(
                                  elevation: 4.0,
                                  icon: Icon(
                                    Icons.send,
                                    color: Colors.orange,
                                  ),
                                  color: Colors.white,
                                  onPressed: () async {
                                    SendRequestController
                                        sendRequestController =
                                        Get.put(SendRequestController());
                                    if (widget.edit) {
                                      EditRequest editRequest = new EditRequest(
                                          day: day,
                                          sessionDuration: (duration),
                                          studentsNum: studentsNumber);
                                      await sendRequestController.editRequest(
                                          editRequest, widget.requestID);
                                    } else {
                                      final SharedPreferences shPr =
                                          await SharedPreferences.getInstance();
                                      String studentID = shPr.getString("id");
                                      AddRequestModel requestInfo =
                                          new AddRequestModel(
                                              day: day,
                                              message: message,
                                              service: widget.serviceId,
                                              sessionDuration: (duration),
                                              sessionType: widget.offline
                                                  ? "offline"
                                                  : "online",
                                              student: studentID,
                                              studentsNum: studentsNumber,
                                              tutor: widget.tutorId);
                                      //send request

                                      await sendRequestController
                                          .sendRequest(requestInfo);
                                    }
                                  },
                                  label: widget.edit
                                      ? Text("Edit Request",
                                          style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 20.0))
                                      : Text("Send Request",
                                          style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 20.0)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Text("This Tutor doesn't accept requests Currently",
                        style: TextStyle(color: Colors.white, fontSize: 25.0))),
          )),
    );
  }
}
