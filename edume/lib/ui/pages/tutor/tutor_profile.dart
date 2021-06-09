import 'package:edume/main.dart';
import 'package:edume/models/student_tutor/tutor_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../shared/auth.dart';
import '../home_screen/student_main.dart';
import '../home_screen/student_main.dart';
import '../login/login_desktop.dart';
import '../login/login_mobile.dart';
import 'tutor-services-ui.dart';

class tutor_profile extends StatefulWidget {

  final TutorAvailabilityDetails myinfo;
  tutor_profile(this.myinfo);
  @override
  _tutor_profileState createState() => _tutor_profileState(myinfo);
}

class _tutor_profileState extends State<tutor_profile> {
  final TutorAvailabilityDetails myinfo;
  _tutor_profileState(this.myinfo);
  @override
  Widget build(BuildContext context) {
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
                      padding: const EdgeInsets.all(8.0), child: Text('Edume'))
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
                          style: TextStyle(color: Colors.white, fontSize: 21))),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.black,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"), fit: BoxFit.cover)),
        //////////////////////////////////////////////////
        child: new SingleChildScrollView(
          child: new Center(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: new Center(
                  child: new Container(
                    width: (MediaQuery.of(context).size.width) / 2,
                    height: 800,
                    color: Colors.black.withOpacity(0.7),
                    padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                    child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(2.0),
                        child: Image.asset(
                          'assets/prof.png',
                          height: 200.0,
                          width: 200.0,
                        ),
                      ),
                      SizedBox(width: 20.0, height: 40.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.orange,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                15, 0, 15, 0),                            child: Text(
                              'Name :  ' + myinfo.name,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white,),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20.0, height: 40.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.orange,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                15, 0, 15, 0),                            child: Text(
                              'Email :  ' + myinfo.email,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20.0, height: 40.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.orange,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                15, 0, 15, 0),                            child: Text(
                              'Phone number :  ' + myinfo.phoneNumber,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20.0, height: 40.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                15, 0, 15, 0),                            child: Text(
                              'Nationality :  ' + myinfo.nationality,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),

                          (() {
                            List<String> days = ['Available On'];
                            for(int i=0; i< myinfo.availability.length; i++){
                              if(myinfo.availability[i].availabe==true)
                              {
                                days.add(myinfo.availability[i].day);

                              }
                            }
                            return Padding(
                              padding: new EdgeInsets.fromLTRB(12, 2, 8, 2),
                              child: DropdownButton<String>(
                                value: "Available On",
                                onTap: () {
                                },

                                style: const TextStyle(color: Colors.orange),
                                underline: Container(
                                  height: 2,
                                  color: Colors.orange,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {

                                  });
                                },
                                items: days.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value, textAlign: TextAlign.center,
                                      style: TextStyle( fontSize: 20,

                                    ),),
                                  );
                                }).toList(),
                              ),
                            );
                          })(),
                        ],
                      ),
                      SizedBox(width: 20.0, height: 60.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         SizedBox(width: 0.0, height: 60.0),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/edit.png',
                                  width: 80.0,
                                  height: 80.0,
                                ),
                              ),
                              SizedBox(width: 20.0, height: 20.0),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Edit Profile ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.lightBlue),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
        ////////////////////////////////////////////////////
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
