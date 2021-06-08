import 'package:edume/models/student_tutor/student_request.dart';
import 'package:edume/widgets/student_request.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TrackRequests extends StatefulWidget {
  final List<StudentRequest> requests;
  TrackRequests({this.requests});
  @override
  _TrackRequestsState createState() => _TrackRequestsState();
}

class _TrackRequestsState extends State<TrackRequests> {
  List<StudentRequestCard> requests = [];
  @override
  void initState() {
    for (int i = 0; i < widget.requests.length; i++) {
      StudentRequestCard requestCard = new StudentRequestCard(
        SR: widget.requests[i],
      );
      requests.add(requestCard);
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: deviceType == DeviceScreenType.desktop
                    ? BoxFit.fill
                    : BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: requests),
          ),
        ),
      ),
    );
  }
}
