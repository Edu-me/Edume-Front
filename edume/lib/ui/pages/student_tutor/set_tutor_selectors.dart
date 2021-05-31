import 'package:edume/widgets/column_card.dart';
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
  // List<ServiceCard> pri_services = [];
  // List<ServiceCard> pre_services = [];
  // List<ServiceCard> sec_services = [];

  @override
  void initState() {
    // for (int i = 0; i < services[0].length; i++) {
    //   ServiceCard serviceCard = new ServiceCard(
    //       offline: widget.offline,
    //       id: (services[0])[i].id,
    //       serviceName: (services[0])[i].subject.subject,
    //       systemLanguage: (services[0])[i].systemLanguage.language);
    //   pri_services.add(serviceCard);
    // }
    // for (int i = 0; i < services[1].length; i++) {
    //   ServiceCard serviceCard = new ServiceCard(
    //       offline: widget.offline,
    //       id: (services[1])[i].id,
    //       serviceName: (services[1])[i].subject.subject,
    //       systemLanguage: (services[1])[i].systemLanguage.language);
    //   pre_services.add(serviceCard);
    // }
    // for (int i = 0; i < services[2].length; i++) {
    //   ServiceCard serviceCard = new ServiceCard(
    //       offline: widget.offline,
    //       id: (services[2])[i].id,
    //       serviceName: (services[2])[i].subject.subject,
    //       systemLanguage: (services[2])[i].systemLanguage.language);
    //   sec_services.add(serviceCard);
    // }
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: widget.all_services
                // children: [
                //   Center(
                //     child: Text(
                //       "Primary level ",
                //       style: TextStyle(color: Colors.white, fontSize: 30),
                //     ),
                //   ),
                //   // ColumCard(services: pri_services),
                //   SizedBox(
                //     height: 20,
                //   ),
                //   Center(
                //     child: Text(
                //       "Preparatory level ",
                //       style: TextStyle(color: Colors.white, fontSize: 30),
                //     ),
                //   ),
                //   // ColumCard(
                //   //   services: pre_services,
                //   // ),
                //   SizedBox(
                //     height: 20,
                //   ),
                //   Center(
                //     child: Text(
                //       "Secondary level ",
                //       style: TextStyle(color: Colors.white, fontSize: 30),
                //     ),
                //   ),
                //   // ColumCard(
                //   //   services: sec_services,
                //   // )
                // ],
                ),
          ),
        ),
      ),
    );
  }
}
