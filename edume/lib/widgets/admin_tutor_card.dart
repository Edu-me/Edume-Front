import 'package:edume/shared/admin-tutor.dart';
import 'package:edume/ui/pages/Admin/Admin.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Admin_Tutor_CustomCard extends StatefulWidget {
  Admin_Tutor AT;
  Admin_Tutor_CustomCard(this.AT);

  @override
  _Admin_Tutor_CustomCardState createState() => _Admin_Tutor_CustomCardState();
}

class _Admin_Tutor_CustomCardState extends State<Admin_Tutor_CustomCard> {
  String dropdownValue = 'Available On';
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
            padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
            child: Center(
              child: Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {},
                  child: new SizedBox(
                    width: 450,
                    height: 350,
                    child: Column(
                      children: [
                        Padding(
                          padding: new EdgeInsets.fromLTRB(2, 15, 2, 2),
                          child: new ListTile(
                            leading: Icon(Icons.person),
                            title: Text("Name"),
                            subtitle: Text(
                              widget.AT.name,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                          child: new ListTile(
                            leading: Icon(Icons.email),
                            title: Text("Email"),
                            subtitle: Text(
                              widget.AT.email,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                          child: new ListTile(
                            leading: Icon(Icons.phone_android),
                            title: Text("Phone Number"),
                            subtitle: Text(
                              widget.AT.phoneNumber,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                          child: new ListTile(
                            leading: Icon(Icons.location_city),
                            title: Text("Nationality"),
                            subtitle: Text(
                              widget.AT.nationality,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                child: const Text(
                                  'Remove',
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () async {
                                  final SharedPreferences shPr =
                                      await SharedPreferences.getInstance();

                                  setState(() {
                                    showReload = true;
                                  });
                                  final String apiUrl =
                                      "http://localhost:3000/Edume/v1/admin/deleteTutor/" +
                                          widget.AT.sId;
                                  final response = await http.delete(
                                    apiUrl,
                                    headers: <String, String>{
                                      'Content-Type':
                                          'application/json; charset=UTF-8',
                                      'x-auth-token': shPr.getString("token"),
                                    },
                                  );
                                  setState(() {
                                    showReload = false;
                                  });
                                  if (response.statusCode == 200) {
                                    final snackBar = SnackBar(
                                      duration:
                                          const Duration(milliseconds: 5000),
                                      content: Text(
                                          'Success! This Tutor has been successfully removed'),
                                      action: SnackBarAction(
                                        label: 'OK',
                                        onPressed: () {
                                          // Some code to undo the change.
                                        },
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                          builder: (context) => Admin()),
                                    );
                                  } else {
                                    final snackBar = SnackBar(
                                      duration:
                                          const Duration(milliseconds: 5000),
                                      content:
                                          Text('Failed! Please try again.'),
                                      action: SnackBarAction(
                                        label: 'OK',
                                        onPressed: () {
                                          // Some code to undo the change.
                                        },
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    Navigator.of(context).pop();
                                  }
                                },
                              ),
                              (() {
                                List<String> days = ['Available On'];
                                for (int i = 0;
                                    i < widget.AT.availability.length;
                                    i++) {
                                  if (widget.AT.availability[i].availabe ==
                                      true) {
                                    days.add(widget.AT.availability[i].day);
                                  }
                                }
                                return Padding(
                                  padding: new EdgeInsets.fromLTRB(12, 2, 8, 2),
                                  child: DropdownButton<String>(
                                    value: dropdownValue,
                                    onTap: () {},
                                    style: const TextStyle(
                                        color: Colors.orange, fontSize: 20),
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
                                        child: Text(value,
                                            textAlign: TextAlign.center),
                                      );
                                    }).toList(),
                                  ),
                                );
                              })(),
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
      }, /////////////////
    );
  }
}
