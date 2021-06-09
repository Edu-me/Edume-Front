import 'package:edume/models/student_tutor/student_request.dart';
import 'package:edume/widgets/student_request.dart';
import 'package:flutter/cupertino.dart';
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
            child: requests.isEmpty ?
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Padding(
                   padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                   child: Text("No requests yet,\n you should start sending some!",
                     style: TextStyle(fontSize: 40, color: Colors.white),
                     textAlign: TextAlign.center,
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                   child: Container(
                     child: new Image.asset(
                       'assets/notfound.png',
                       height: 280.0,
                       width: 280,
                       fit: BoxFit.contain,
                     ),
                   ),
                 ),

               ],
            ): Column(children: requests),
          ),
        ),
      ),
    );
  }
}
