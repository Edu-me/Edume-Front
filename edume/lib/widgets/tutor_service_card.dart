import 'dart:convert';

import 'package:edume/shared/tutor-service.dart';
import 'package:edume/ui/pages/home_screen/tutor_main.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CustomCard extends StatefulWidget {
  Tutor_Service TS;
  CustomCard(this.TS);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  String dropdownValue = 'Update';
  bool showReload = false;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return ModalProgressHUD(
          inAsyncCall: showReload,
          opacity: 0,
          progressIndicator: CircularProgressIndicator(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
            child: Center(
              child: Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {},
                  child: new SizedBox(
                    width: 350,
                    height: widget.TS.mode == 'online' ? 275 : 330,
                    child: Column(
                      children: [
                        Padding(
                          padding: new EdgeInsets.fromLTRB(2, 15, 2, 2),
                          child: new ListTile(
                            leading: Icon(Icons.school, color: Colors.orange,),
                            title: Text(widget.TS.service.subject.subject),
                            subtitle: Text('Level: ' +
                                widget.TS.service.level.level +
                                '\n' +
                                'System Language: ' +
                                widget.TS.service.systemLanguage.language),
                          ),
                        ),
                        (() {
                          if (widget.TS.mode == 'online') {
                            return Text("");
                          } else
                            return Padding(
                              padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: new ListTile(
                                leading: Icon(Icons.location_city,color: Colors.orange,),
                                title: Text("Locations"),
                                subtitle: Text(widget.TS.locations.join(",")),
                              ),
                            );
                        })(),
                        Padding(
                          padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                          child: new ListTile(
                            leading: Icon(Icons.info, color: Colors.orange,),
                            title: Text("General"),
                            subtitle: Text('Availability: ' +
                                widget.TS.availability.toString() +
                                "\n" +
                                'Mode: ' +
                                widget.TS.mode),
                          ),
                        ),
                        Padding(
                          padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                          child: new ListTile(
                            leading: Icon(Icons.star, color: Colors.orange,),
                            title: Text("Rating"),
                            subtitle: Text(widget.TS.rating.toString() + ' out of 5'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                child: const Text('Delete'),
                                onPressed: () async {
                                  setState(() {
                                    showReload = true;
                                  });
                                  final SharedPreferences shPr =
                                  await SharedPreferences.getInstance();

                                  final String apiUrl =
                                      "http://localhost:3000/Edume/v1/tutor/services/" +
                                          widget.TS.sId;
                                  final response = await http.delete(
                                    apiUrl,
                                    headers: <String, String>{
                                      'Content-Type': 'application/json; charset=UTF-8',
                                      'x-auth-token': shPr.getString("token"),
                                    },
                                  );

                                  setState(() {
                                    showReload = false;
                                  });
                                  if (response.statusCode == 200) {
                                    final snackBar = SnackBar(
                                      duration: const Duration(milliseconds: 20000),
                                      content: Text(
                                          'Success! This service has been successfully deleted'),
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
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => tutor_main()),
                                    );
                                  } else {
                                    print(response.body);
                                    final snackBar = SnackBar(
                                      duration: const Duration(milliseconds: 20000),
                                      content: Text('Failed! Please try again.'),
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
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    Navigator.of(context).pop();
                                  }
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: DropdownButton<String>(
                                  value: dropdownValue,
                                  onTap: () {
                                  },
                                  icon: const Icon(Icons.edit),
                                  iconSize: 20,
                                  style: const TextStyle(color: Colors.orange),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.orange,
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                      if(dropdownValue == "Availability")
                                      {
                                        showUpdateAvailDialog(context, widget.TS.sId);

                                      }else if(dropdownValue == "Locations"){
                                        showUpdateLocDialog(context, widget.TS.sId);
                                      }
                                    });
                                  },
                                  items: widget.TS.mode == "offline"? <String>['Update','Availability','Locations'] .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value, textAlign: TextAlign.center),
                                    );
                                  }).toList()
                                      :<String>['Update','Availability']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value, textAlign: TextAlign.center),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },/////////////////
    );
  }
}

//////////////////////Show alert dialogue
Future<void> showUpdateAvailDialog(BuildContext context, String id) async {
  final availabilityController = TextEditingController();
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Update Service Availability'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: availabilityController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Is this service available?",
                      hintText: 'Yes or No'),
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
                String availability = availabilityController.text;
                final SharedPreferences shPr =
                await SharedPreferences.getInstance();

                if (availability != "") {
                  final String apiUrl =
                      "http://localhost:3000/Edume/v1/tutor/services/updateAvailability/" +
                          id;
                  final response = await http.put(apiUrl,
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                        'x-auth-token': shPr.getString("token"),
                      },
                      //json doesn't take mapping list sa3at
                      body: jsonEncode({
                        "availability":
                        availability.toLowerCase().replaceAll(" ", "") ==
                            "yes"
                            ? true
                            : false,
                      }));

                  if(response.statusCode == 200 ){

                    final snackBar = SnackBar(
                      duration: const Duration(milliseconds: 5000),
                      content: Text(
                          'Success! The availability is updated successfully'),
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
                      MaterialPageRoute(builder: (context) => tutor_main()),
                    );
                  }else{

                    final snackBar = SnackBar(
                      duration: const Duration(milliseconds: 5000),
                      content: Text(
                          'Failed! Please Enter valid data'),
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
                }
                else{
                  final snackBar = SnackBar(
                    duration: const Duration(milliseconds: 5000),
                    content: Text(
                        'Failed! Please Enter valid data'),
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

/////////////////////////////////////////////////////////////////

Future<void> showUpdateLocDialog(BuildContext context, String id) async {
  final LocationsController = TextEditingController();
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Update Service Locations'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: LocationsController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter locations if offline",
                      hintText: 'Ex: Cairo Giza'),
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
                List<String> Locations = LocationsController.text.split(" ");
                for(int i=0; i<Locations.length; i++){
                  Locations[i].replaceAll(" ", "");
                }
                final SharedPreferences shPr =
                await SharedPreferences.getInstance();
                if (Locations.length !=0) {
                  final String apiUrl =
                      "http://localhost:3000/Edume/v1/tutor/services/updateLocation/" +
                          id;
                  final response = await http.put(apiUrl,
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                        'x-auth-token': shPr.getString("token"),
                      },
                      //json doesn't take mapping list sa3at
                      body: jsonEncode({
                        "locations": Locations,
                      }));

                  if(response.statusCode == 200 ){

                    final snackBar = SnackBar(
                      duration: const Duration(milliseconds: 5000),
                      content: Text(
                          'Success! The Locations are updated successfully'),
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
                      MaterialPageRoute(builder: (context) => tutor_main()),
                    );
                  }else{

                    final snackBar = SnackBar(
                      duration: const Duration(milliseconds: 5000),
                      content: Text(
                          'Failed! Please Enter valid data'),
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
                }
                else{
                  final snackBar = SnackBar(
                    duration: const Duration(milliseconds: 5000),
                    content: Text(
                        'Failed! Please Enter valid data'),
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

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.of(context).pop();
                }
              }),
        ],
      );
    },
  );
}
