import 'dart:convert';
import 'dart:developer';

import 'package:edume/shared/tutor-service.dart';
import 'package:edume/ui/pages/tutor/add-service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Tutor_Services extends StatefulWidget {
final  List<Tutor_Service> myservices;
Tutor_Services(this.myservices);
  @override
  _Tutor_ServicesState createState() => _Tutor_ServicesState(myservices);
}

class _Tutor_ServicesState extends State<Tutor_Services> {

  final  List<Tutor_Service> myservices;
  _Tutor_ServicesState(this.myservices);

  //System Services:
  List<Service> sysServices =[];
  Future<bool> GetSystemServices() async {
    final String apiUrl = "http://localhost:3000/Edume/v1/system/services";
    final response = await http.get(apiUrl,
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      for (int i = 0; i < (jsonDecode(response.body)).length; i++) {
        Service service = new Service();
        service.sId = ((jsonDecode(response.body))[i])["_id"];
        service.subject = new Subject();
        service.subject.subject = ((jsonDecode(response.body))[i])["subject"]["subject"];
        service.level = new Level();
        service.level.level = ((jsonDecode(response.body))[i])["level"]["level"];

        service.systemLanguage = new SystemLanguage();
        service.systemLanguage.language = ((jsonDecode(response.body))[i])["systemLanguage"]["language"];
        sysServices.add(service);

      }
      return true;
    } else

      return false;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          title: Row(
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
          backgroundColor: Colors.black,

        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 80, 30),
        child: Container(
          height: 100.0,
          width: 100.0,
          child: FittedBox(
            child: FloatingActionButton(
                onPressed: () async{
                  await GetSystemServices();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Add_Service(sysServices)),
                  );
                },
              child: const Icon(Icons.add, size: 30,),
              backgroundColor: Colors.orange,
                ),
          ),
        ),
      ),


      /////////////////
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover)),
         child: SingleChildScrollView(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
            (() {
                  if(myservices.length == 0)
                  {
                    return Text("You have no services, Click to add your first!");
                  }
                  else
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                      child: new ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: new List.generate(myservices.length, (i)=>new CustomCard(myservices[i])),
                      ),
                    );

                  })(),
             ],
           ),
         ),
      ),

      /////////////////
    );
  }
}

class CustomCard extends StatelessWidget {
   Tutor_Service TS;
  CustomCard(this.TS);
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
          },
          child: new SizedBox(
            width: 350,
            height: 280,
            child: Column(
              children: [
                Padding(
                  padding: new EdgeInsets.fromLTRB(2, 8, 2, 2),
                  child: new ListTile(
                    leading: Icon(Icons.school),
                    title: Text(TS.service.subject.subject),
                    subtitle: Text('Level: '+TS.service.level.level + '\n'+ 'System Language: '+TS.service.systemLanguage.language),
                  ),
                ),

                Padding(
                  padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                  child: new ListTile(
                    leading: Icon(Icons.location_city),
                    title: Text("Locations"),
                    subtitle: Text(TS.locations.join(",")),
                  ),
                ),

                Padding(
                  padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                  child: new ListTile(
                    leading: Icon(Icons.info),
                    title: Text("General"),
                    subtitle: Text('Availability: '+TS.availability.toString() + "\n" + 'Mode: ' + TS.mode),
                  ),
                ),

                Padding(
                  padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                  child: new ListTile(
                    leading: Icon(Icons.star),
                    title: Text("Rating"),
                    subtitle: Text(TS.rating.toString()+ ' out of 5'),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

