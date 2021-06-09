import 'dart:convert';
import 'dart:developer';

import 'package:edume/shared/tutor-service.dart';
import 'package:edume/ui/pages/home_screen/tutor_main.dart';
import 'package:edume/ui/pages/tutor/add-service.dart';
import 'package:edume/widgets/tutor_service_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tutor_Services extends StatefulWidget {
  final List<Tutor_Service> myservices;
  Tutor_Services(this.myservices);
  @override
  _Tutor_ServicesState createState() => _Tutor_ServicesState(myservices);
}

class _Tutor_ServicesState extends State<Tutor_Services> {
  final List<Tutor_Service> myservices;
  _Tutor_ServicesState(this.myservices);
  List<Service> sysServices = [];
  Future<bool> GetSystemServices() async {
    final String apiUrl = "http://localhost:3000/Edume/v1/system/services";
    final response = await http.get(apiUrl, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    if (response.statusCode == 200) {
      for (int i = 0; i < (jsonDecode(response.body)).length; i++) {
        Service service = new Service();
        service.sId = ((jsonDecode(response.body))[i])["_id"];
        service.subject = new Subject();
        service.subject.subject =
            ((jsonDecode(response.body))[i])["subject"]["subject"];
        service.level = new Level();
        service.level.level =
            ((jsonDecode(response.body))[i])["level"]["level"];

        service.systemLanguage = new SystemLanguage();
        service.systemLanguage.language =
            ((jsonDecode(response.body))[i])["systemLanguage"]["language"];
        sysServices.add(service);
      }
      return true;
    } else
      return false;
  }

  bool showReload = false;
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
                      padding: const EdgeInsets.all(8.0), child: Text('Edume')),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 20, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: RaisedButton.icon(
                      icon: Icon(
                        Icons.add,
                        size: 20,
                      ),
                      color: Colors.orange,
                      onPressed: () async {
                        setState(() {
                          showReload = true;
                        });
                        await GetSystemServices();
                        setState(() {
                          showReload = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Add_Service(sysServices)),
                        );
                      },
                      label: Text("Add Service",
                          style: TextStyle(color: Colors.white, fontSize: 21))),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.black,
        ),
      ),

      /////////////////
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (() {
                if (myservices.length == 0) {
                  return Text("You have no services, Click to add your first!");
                } else
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                    child: new ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: new List.generate(myservices.length,
                          (i) => new CustomCard(myservices[i])),
                    ),
                  );
              })(),
            ],
          ),
        ),
      ),
       );
        },/////////////////
      ),
      /////////////////
    );
  }
}


