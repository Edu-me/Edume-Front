import 'dart:convert';

import 'package:edume/main.dart';
import 'package:edume/shared/tutor_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../shared/auth.dart';
import 'package:http/http.dart' as http;

class Student_Profile extends StatefulWidget {
  final Student myinfo;
  Student_Profile(this.myinfo);
  @override
  _Student_ProfileState createState() => _Student_ProfileState(myinfo);
}

class _Student_ProfileState extends State<Student_Profile> {
  final Student myinfo;
  bool showReload = false;
  _Student_ProfileState(this.myinfo);
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
        body: Builder(
          builder: (context) {
            return ModalProgressHUD(
              inAsyncCall: showReload,
              opacity: 0,
              progressIndicator: CircularProgressIndicator(),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/background.jpg"),
                        fit: BoxFit.cover)),
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
                                          15, 0, 15, 0),
                                      child: Text(
                                        'Name :  ' + myinfo.name,
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
                                  /////////////////////////////
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        color: Colors.orange,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 0, 15, 0),
                                      child: Text(
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
                                          15, 0, 15, 0),
                                      child: Text(
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
                                SizedBox(width: 20.0, height: 75.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            setState(() {
                                              showReload = true;
                                            });
                                            await showUpdateDialog(
                                                context, myinfo);
                                            setState(() {
                                              showReload = false;
                                            });
                                          },
                                          child: Image.asset(
                                            'assets/edit.png',
                                            width: 60.0,
                                            height: 60.0,
                                          ),
                                        ),
                                        SizedBox(width: 20.0, height: 20.0),
                                        InkWell(
                                          onTap: () {},
                                          child: Text(
                                            'Edit Name ',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.lightBlue),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 50.0, height: 60.0),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            setState(() {
                                              showReload = true;
                                            });
                                            await showUpdatePhoneDialog(
                                                context, myinfo);
                                            setState(() {
                                              showReload = false;
                                            });
                                          },
                                          child: Image.asset(
                                            'assets/edit.png',
                                            width: 60.0,
                                            height: 60.0,
                                          ),
                                        ),
                                        SizedBox(width: 20.0, height: 20.0),
                                        InkWell(
                                          onTap: () {},
                                          child: Text(
                                            'Edit Phone number ',
                                            style: TextStyle(
                                                fontSize: 17,
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
          }, /////////////////
        ));
  }
}

Future<void> showUpdateDialog(BuildContext context, Student myinfo) async {
  final NameController = TextEditingController();

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Update Name'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: NameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Name",
                      hintText: 'Ex: Edume'),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          TextButton(
              child: const Text('Update'),
              onPressed: () async {
                String Name = NameController.text;
                final SharedPreferences shPr =
                    await SharedPreferences.getInstance();
                shPr.setString("phone", myinfo.phoneNumber);
                if (Name != "") {
                  final String apiUrl =
                      "http://localhost:3000/Edume/v1/student/me";
                  final response = await http.put(apiUrl,
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                        'x-auth-token': shPr.getString("token"),
                      },
                      //json doesn't take mapping list sa3at
                      body: jsonEncode({
                        "phoneNumber": shPr.getString("phone"),
                        "name": Name,
                      }));

                  if (response.statusCode == 200) {
                    final snackBar = SnackBar(
                      duration: const Duration(milliseconds: 5000),
                      content:
                          Text('Success! The Name is updated successfully'),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    );

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    myinfo.name = Name;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Student_Profile(myinfo)),
                    );
                  } else {
                    final snackBar = SnackBar(
                      duration: const Duration(milliseconds: 5000),
                      content: Text('Failed! Please Enter valid data'),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    );

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.of(context).pop();

                  }
                } else {
                  final snackBar = SnackBar(
                    duration: const Duration(milliseconds: 5000),
                    content: Text('Failed! Please Enter valid data'),
                    action: SnackBarAction(
                      label: 'OK',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  );

                  // Find the ScaffoldMessenger in the widget tree
                  // and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.of(context).pop();
                }
              }),
        ],
      );
    },
  );
}

Future<void> showUpdatePhoneDialog(BuildContext context, Student myinfo) async {
  final NumberController = TextEditingController();
  String oldName = "";
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Update Phone Number'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: NumberController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Phone Number",
                      hintText: 'Ex: 011********'),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          TextButton(
              child: const Text('Update'),
              onPressed: () async {
                String num = NumberController.text;
                final SharedPreferences shPr =
                    await SharedPreferences.getInstance();
                oldName = shPr.getString("name");
                if (num != "") {
                  shPr.setString("name", myinfo.name);
                  final String apiUrl =
                      "http://localhost:3000/Edume/v1/student/me";
                  final response = await http.put(apiUrl,
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                        'x-auth-token': shPr.getString("token"),
                      },
                      //json doesn't take mapping list sa3at
                      body: jsonEncode({
                        "phoneNumber": num,
                        "name": shPr.getString("name"),
                      }));

                  if (response.statusCode == 200) {
                    final snackBar = SnackBar(
                      duration: const Duration(milliseconds:5000),
                      content: Text(
                          'Success! The Phone number is updated successfully'),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    );

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.of(context).pop();
                    myinfo.phoneNumber = num;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Student_Profile(myinfo)),
                    );
                  } else {
                    final snackBar = SnackBar(
                      duration: const Duration(milliseconds: 5000),
                      content: Text('Failed! Please Enter valid data'),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    );

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.of(context).pop();
                  }
                } else {
                  final snackBar = SnackBar(
                    duration: const Duration(milliseconds: 5000),
                    content: Text('Failed! Please Enter valid data'),
                    action: SnackBarAction(
                      label: 'OK',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  );

                  // Find the ScaffoldMessenger in the widget tree
                  // and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.of(context).pop();
                }
              }),
        ],
      );
    },
  );
}
