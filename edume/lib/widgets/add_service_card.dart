import 'dart:convert';
import 'package:edume/shared/tutor-service.dart';
import 'package:edume/ui/pages/home_screen/tutor_main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CustomCard_AddService extends StatelessWidget {
  Service S;
  CustomCard_AddService(this.S);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
      child: Center(
        child: Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {},
            child: new SizedBox(
              width: 350,
              height: 100,
              child: Column(
                children: [
                  Padding(
                    padding: new EdgeInsets.fromLTRB(2, 8, 2, 2),
                    child: new ListTile(
                      leading: Icon(Icons.school, color: Colors.orange,),
                      title: Text(S.subject.subject),
                      subtitle: Text('Level: ' +
                          S.level.level +
                          '\n' +
                          'System Language: ' +
                          S.systemLanguage.language),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Add'),
                        onPressed: () {
                          showMyDialog(context, S.sId);
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//////////////////////Show alert dialogue
Future<void> showMyDialog(BuildContext context, String id) async {
  final ModeController = TextEditingController();
  final LocationController = TextEditingController();
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Additional Information'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: LocationController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter locations if offline",
                      hintText: 'Ex: Cairo Giza'),
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: ModeController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Is Service offline or online?",
                      hintText: 'Ex: offline'),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
              child: const Text('Cancel'),
              onPressed: ()  {
                Navigator.of(context).pop();
              }
          ),
          TextButton(
            child: const Text('Add'),
            onPressed: () async {
              List<String> Locations = LocationController.text.split(" ");
              print(Locations);
              String mode = ModeController.text;
              final SharedPreferences shPr =
              await SharedPreferences.getInstance();
              final String apiUrl =
                  "http://localhost:3000/Edume/v1/tutor/services";
              if (mode.toLowerCase() == "offline") {
                final response = await http.post(apiUrl,
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                      'x-auth-token': shPr.getString("token"),
                    },
                    //json doesn't take mapping list sa3at
                    body: jsonEncode({
                      "tutor": shPr.getString("id"),
                      "service": id,
                      "mode": mode,
                      "locations": Locations,
                    }));

                if (response.statusCode == 200) {
                  final snackBar = SnackBar(
                    duration: const Duration(milliseconds: 5000),
                    content: Text(
                        'Success! Congrats on the new service! we hope you make good money ;)'),
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
                } else {
                  final snackBar = SnackBar(
                    duration: const Duration(milliseconds: 5000),
                    content: Text(
                        'Failed! Please check your input data, is it valid?'),
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


              } else {
                final response = await http.post(apiUrl,
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                      'x-auth-token': shPr.getString("token"),
                    },
                    body: jsonEncode(<String, String>{
                      "tutor": shPr.getString("id"),
                      "service": id,
                      "mode": mode,
                    }));

                if (response.statusCode == 200) {
                  final snackBar = SnackBar(
                    duration: const Duration(milliseconds: 5000),
                    content: Text(
                        'Success! Congrats on the new service! we hope you make good money ;)'),
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
                  Navigator.of(context).pop();

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => tutor_main()),
                  );
                } else {
                  final snackBar = SnackBar(
                    duration: const Duration(milliseconds: 5000),
                    content: Text(
                        'Failed! Please check your input data, is it valid?'),
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
                  Navigator.of(context).pop();                }
              }
            },
          ),

        ],
      );
    },
  );
}
