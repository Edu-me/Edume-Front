import 'package:edume/shared/tutor-service.dart';
import 'package:edume/shared/validate.dart';
import 'package:flutter/material.dart';
class Add_Service extends StatefulWidget {
  final List<Service> sysServices;
  Add_Service(this.sysServices);

  @override
  _Add_ServiceState createState() => _Add_ServiceState(this.sysServices);
}

class _Add_ServiceState extends State<Add_Service> {
  final List<Service> sysServices;
  _Add_ServiceState(this.sysServices);
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
                if(sysServices.length == 0)
                {
                  return Text("Come Back Later");
                }
                else
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                    child: new ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: new List.generate(sysServices.length, (i)=>new CustomCard_AddService(sysServices[i])),
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

class CustomCard_AddService extends StatelessWidget {
  Service S;
  CustomCard_AddService(this.S);
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
            height: 100,
            child: Column(
              children: [
                Padding(
                  padding: new EdgeInsets.fromLTRB(2, 8, 2, 2),
                  child: new ListTile(
                    leading: Icon(Icons.school),
                    title: Text(S.subject.subject),
                    subtitle: Text('Level: '+S.level.level + '\n'+ 'System Language: '+S.systemLanguage.language),
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

//////////////////////Show alert dialogue

