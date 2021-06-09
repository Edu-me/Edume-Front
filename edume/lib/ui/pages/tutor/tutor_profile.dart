import 'dart:convert';

import 'package:edume/main.dart';
import 'package:edume/models/student_tutor/tutor_details.dart';
import 'package:edume/ui/pages/home_screen/tutor_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../shared/auth.dart';

class tutor_profile extends StatefulWidget {
  final TutorAvailabilityDetails myinfo;
  tutor_profile(this.myinfo);
  @override
  _tutor_profileState createState() => _tutor_profileState(myinfo);
}

class _tutor_profileState extends State<tutor_profile> {
  final TutorAvailabilityDetails myinfo;
  bool showReload = false;
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
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: Text(
                                    'Name :  ' + myinfo.name,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                            SizedBox(width: 20.0, height: 40.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: Text(
                                    'About Me :  ' + myinfo.about,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 20.0, height: 40.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: Text(
                                    'Nationality :  ' + myinfo.nationality,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                                (() {
                                  List<String> days = ['Available On'];
                                  for (int i = 0;
                                      i < myinfo.availability.length;
                                      i++) {
                                    if (myinfo.availability[i].availabe ==
                                        true) {
                                      days.add(myinfo.availability[i].day);
                                    }
                                  }
                                  return Padding(
                                    padding:
                                        new EdgeInsets.fromLTRB(12, 2, 8, 2),
                                    child: DropdownButton<String>(
                                      value: "Available On",
                                      onTap: () {},
                                      style:
                                          const TextStyle(color: Colors.orange),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.orange,
                                      ),
                                      onChanged: (String newValue) {
                                        setState(() {});
                                      },
                                      items: days.map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  );
                                })(),
                              ],
                            ),
                            SizedBox(width: 20.0, height: 60.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(width: 0.0, height: 60.0),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () async{
                                        setState(() {
                                          showReload = true;
                                        });
                                        await showUpdateNameDialogTutor(context, myinfo);
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
                                    Text(
                                      'Edit Name',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.lightBlue),
                                    ),
                                  ],
                                ),

                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () async{
                                        setState(() {
                                          showReload = true;
                                        });
                                        await showUpdatePhoneDialogTutor(context, myinfo);
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
                                    Text(
                                      'Edit Phone',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.lightBlue),
                                    ),
                                  ],
                                ),

                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () async{
                                        setState(() {
                                          showReload = true;
                                        });
                                        await showUpdateAboutMeDialogTutor(context, myinfo);
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
                                    Text(
                                      'Edit About',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.lightBlue),
                                    ),
                                  ],
                                ),

                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () async{
                                        setState(() {
                                          showReload = true;
                                        });
                                        print("before await");
                                        await showUpdateAvailabilityDialogTutor(context, myinfo);
                                        print("after await");

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
                                    Text(
                                      'Edit Availability',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.lightBlue),
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
      )
    );
  }
}

Future<void> showUpdateNameDialogTutor(BuildContext context, TutorAvailabilityDetails myinfo) async {
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
                String name = NameController.text;
                final SharedPreferences shPr =
                await SharedPreferences.getInstance();
                if (name != "") {
                  shPr.setString("phone", myinfo.phoneNumber);
                  final String apiUrl =
                      "http://localhost:3000/Edume/v1/tutor/me/info";
                  final response = await http.put(apiUrl,
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                        'x-auth-token': shPr.getString("token"),
                      },
                      body: jsonEncode({
                        "name": name,
                        "phoneNumber": myinfo.phoneNumber,
                      }));
                    print(response.body);
                  if (response.statusCode == 200) {
                    final snackBar = SnackBar(
                      duration: const Duration(milliseconds: 5000),
                      content: Text(
                          'Success! The Name is updated successfully'),
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
                    myinfo.name = name;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => tutor_profile(myinfo)),
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


Future<void> showUpdatePhoneDialogTutor(BuildContext context, TutorAvailabilityDetails myinfo) async {
  final numController = TextEditingController();
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
                  controller: numController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Phone Number",
                      hintText: 'Ex: 01*********'),
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
                String phone = numController.text;
                final SharedPreferences shPr =
                await SharedPreferences.getInstance();
                if (phone != "") {
                  shPr.setString("name", myinfo.name);
                  final String apiUrl =
                      "http://localhost:3000/Edume/v1/tutor/me/info";
                  final response = await http.put(apiUrl,
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                        'x-auth-token': shPr.getString("token"),
                      },
                      body: jsonEncode({
                        "name": myinfo.name,
                        "phoneNumber": phone,
                      }));
                  if (response.statusCode == 200) {
                    final snackBar = SnackBar(
                      duration: const Duration(milliseconds: 5000),
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
                    Navigator.of(context).pop();
                    myinfo.phoneNumber = phone;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => tutor_profile(myinfo)),
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

Future<void> showUpdateAboutMeDialogTutor(BuildContext context, TutorAvailabilityDetails myinfo) async {
  final AboutController = TextEditingController();
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Tell people about yourself'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: AboutController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "About Me",
                      hintText: 'Ex: Arabic Tutor'),
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
                String about = AboutController.text;
                final SharedPreferences shPr =
                await SharedPreferences.getInstance();

                  shPr.setString("phone", myinfo.phoneNumber);
                  shPr.setString("name", myinfo.name);
                  final String apiUrl =
                      "http://localhost:3000/Edume/v1/tutor/me/info";
                  final response = await http.put(apiUrl,
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                        'x-auth-token': shPr.getString("token"),
                      },
                      body: jsonEncode({
                        "name": myinfo.name,
                        "phoneNumber": myinfo.phoneNumber,
                        "about": about,
                      }));
                  if (response.statusCode == 200) {
                    final snackBar = SnackBar(
                      duration: const Duration(milliseconds: 5000),
                      content: Text(
                          'Success! The About Me section is updated successfully'),
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
                    myinfo.about = about;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => tutor_profile(myinfo)),
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

              }),
        ],
      );
    },
  );
}

Future<void> showUpdateAvailabilityDialogTutor(BuildContext context, TutorAvailabilityDetails myinfo) async {
  final sunday = TextEditingController();
  final monday = TextEditingController();
  final tuesday = TextEditingController();
  final wedensday = TextEditingController();
  final thursday = TextEditingController();
  final friday = TextEditingController();
  final saturday = TextEditingController();

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Update Availability'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: sunday,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Sunday?",
                      hintText: 'Ex: Yes/ No'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: monday,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Monday?",
                      hintText: 'Ex: Yes/ No'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: tuesday,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Tuesday?",
                      hintText: 'Ex: Yes/ No'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: wedensday,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Wednesday?",
                      hintText: 'Ex: Yes/ No'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: thursday,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Thursday?",
                      hintText: 'Ex: Yes/ No'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: friday,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Friday?",
                      hintText: 'Ex: Yes/ No'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: saturday,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Saturday?",
                      hintText: 'Ex: Yes/ No'),
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
                List<bool> arr = [];
                String sun = sunday.text;
                String mon =  monday.text;
                String tue = tuesday.text;
                String wed = wedensday.text;
                String thur = thursday.text;
                String fri = friday.text;
                String sat = saturday.text;
                if(sun.toLowerCase() == "yes") arr.add(true); else arr.add(false);
                if(mon.toLowerCase() == "yes") arr.add(true); else arr.add(false);
                if(tue.toLowerCase() == "yes") arr.add(true); else arr.add(false);
                if(wed.toLowerCase() == "yes") arr.add(true); else arr.add(false);
                if(thur.toLowerCase() == "yes") arr.add(true); else arr.add(false);
                if(fri.toLowerCase() == "yes") arr.add(true); else arr.add(false);
                if(sat.toLowerCase() == "yes") arr.add(true); else arr.add(false);
                print(arr);
                final SharedPreferences shPr =
                await SharedPreferences.getInstance();

                Uri url = Uri.parse('http://localhost:3000/Edume/v1/tutor/me/availability');

                  final response = await http.put(url,
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                        'x-auth-token': shPr.getString("token"),
                      },
                      body: jsonEncode(arr),
                  );
                  print(response.body);
                  if (response.statusCode == 200) {
                    final snackBar = SnackBar(
                      duration: const Duration(milliseconds: 5000),
                      content: Text(
                          'Success! The Availability is updated successfully'),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => tutor_main()),
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

              }),
        ],
      );
    },
  );
}

