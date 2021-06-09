import 'package:edume/main.dart';
import 'package:edume/shared/auth.dart';
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
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Edume'))
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 20, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: RaisedButton.icon(
                      icon: Icon(
                        Icons.logout,
                        size: 20,
                      ),
                      color: Colors.orange,
                      onPressed: () {
                        Navigator.pop(context);
                        Auth.logout();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScreenTypeLayout.builder(
                                mobile: (BuildContext context) =>
                                    MyHomePage(title: 'Edume'),
                                desktop: (BuildContext context) =>
                                    MyHomePage(title: 'Edume'),
                              )),
                        );
                      },
                      label: Text("Logout",
                          style:
                          TextStyle(color: Colors.white, fontSize: 21))),
                ),
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
            child: Column(children: widget.all_services),
          ),
        ),
      ),
    );
  }
}
