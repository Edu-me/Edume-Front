import 'package:flutter/material.dart';
import 'package:edume/widgets/selector_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:edume/constants.dart' as constants;

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
              // SelectorWidget(
              //   text: "subject",
              //   items: subjects,
              // ),
              SelectorWidget(
                text: "level",
                items: ["All", "primary", "preparatory", "secondary"],
              ),
              widget.offline
                  ? SelectorWidget(
                      text: "location",
                      items: constants.locations,
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
