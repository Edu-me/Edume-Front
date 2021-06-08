import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../shared/auth.dart';
import '../home_screen/student_main.dart';
import '../home_screen/student_main.dart';
import '../login/login_desktop.dart';
import '../login/login_mobile.dart';
import 'tutor-services-ui.dart';

class tutor_profile extends StatelessWidget {
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
                                        Login_Mobile('tutor'),
                                    desktop: (BuildContext context) =>
                                        Login_Desktop('tutor'),
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
            child: new Column(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: new Center(
                  child: new Container(
                    width: (MediaQuery.of(context).size.width) / 2,
                    height: (MediaQuery.of(context).size.height),
                    color: Colors.black.withOpacity(0.7),
                    padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            //SizedBox(width: 20.0, height: 40.0),
                            Row(
                              /////////////////////////////
                              children: [
                                Text(
                                  'Name :  ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(width: 20.0, height: 40.0),
                            Row(
                              /////////////////////////////
                              children: [
                                Text(
                                  'Email :  ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(width: 20.0, height: 40.0),
                            Row(
                              /////////////////////////////
                              children: [
                                Text(
                                  'Phone number :  ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(width: 20.0, height: 40.0),
                            Row(
                              children: [
                                Text(
                                  'Nationality :  ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(width: 20.0, height: 40.0),
                            Row(
                              children: [
                                Text(
                                  'About :  ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(width: 20.0, height: 60.0),
                            Row(
                              children: [
                               SizedBox(width: 120.0, height: 60.0),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/edit.png',
                                        width: 100.0,
                                        height: 100.0,
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
