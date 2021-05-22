import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import "package:edume/widgets/service_card.dart";

class SetTutorSelectors extends StatefulWidget {
  final bool offline;
  SetTutorSelectors({this.offline});
  @override
  _SetTutorSelectorsState createState() => _SetTutorSelectorsState();
}

class _SetTutorSelectorsState extends State<SetTutorSelectors> {
  List<String> subjects;
  @override
  void initState() {
    //----------------------------------------------get subjects from back end
  }
  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    return Scaffold(
      backgroundColor: Colors.white,
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
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Primary level ",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  ServiceCard(
                    offline: widget.offline,
                    serviceName: "Arabic",
                    systemLanguage: "arabic",
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
