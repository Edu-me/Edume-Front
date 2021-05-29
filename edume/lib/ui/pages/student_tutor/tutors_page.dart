import 'package:edume/widgets/tutor_card.dart';
import "package:flutter/material.dart";
import 'package:responsive_builder/responsive_builder.dart';

class TutorPage extends StatelessWidget {
  final bool offline;
  TutorPage({this.offline});
  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade900,
        title: offline ? Text("Offline Tutors") : Text("Online Tutors"),
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
            children: [
              TutorCard(
                tutorName: "Mohamed",
                email: "mohamed@gmail.com",
                phoneNumber: "0114979789",
                availableDays: ["monday", "saturday"],
                locations: ["Cairo"],
                rating: 4.5,
                offline: offline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
