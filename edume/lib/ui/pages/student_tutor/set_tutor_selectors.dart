import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import "package:edume/widgets/service_card.dart";

class SetTutorSelectors extends StatefulWidget {
  final bool offline;
  final List<ServiceCard> all_services;
  SetTutorSelectors({this.offline, this.all_services});
  @override
  _SetTutorSelectorsState createState() => _SetTutorSelectorsState();
}

class _SetTutorSelectorsState extends State<SetTutorSelectors> {
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
            child: Column(children: widget.all_services),
          ),
        ),
      ),
    );
  }
}
