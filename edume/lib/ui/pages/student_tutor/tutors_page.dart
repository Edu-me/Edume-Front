import 'package:edume/models/student_tutor/service_tutors_res.dart';
import 'package:edume/widgets/tutor_card.dart';
import "package:flutter/material.dart";
import 'package:responsive_builder/responsive_builder.dart';

class TutorPage extends StatefulWidget {
  final bool offline;
  final List<ServiceTutorsResponse> tutorsList;
  TutorPage({this.offline, this.tutorsList});

  @override
  _TutorPageState createState() => _TutorPageState();
}

class _TutorPageState extends State<TutorPage> {
  List<TutorCard> tutorsCard = [];
  @override
  void initState() {
    for (int i = 0; i < widget.tutorsList.length; i++) {
      TutorCard tutorCard = new TutorCard(
        id: widget.tutorsList[i].tutor.id,
        locations: widget.tutorsList[i].locations,
        tutorName: widget.tutorsList[i].tutor.name,
        rating: widget.tutorsList[i].rating,
        phoneNumber: widget.tutorsList[i].tutor.phoneNumber,
        nationality: widget.tutorsList[i].tutor.nationality,
        offline: widget.offline,
      );
      tutorsCard.add(tutorCard);
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade900,
        title: widget.offline ? Text("Offline Tutors") : Text("Online Tutors"),
        centerTitle: true,
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: ListView(
            shrinkWrap: true,
            children: tutorsCard,
          ),
        ),
      ),
    );
  }
}
