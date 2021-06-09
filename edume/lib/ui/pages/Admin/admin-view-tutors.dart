import 'package:edume/main.dart';
import 'package:edume/shared/admin-tutor.dart';
import 'package:edume/shared/auth.dart';
import 'package:edume/widgets/admin_tutor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'Admin.dart';

class Admin_View_Tutor extends StatefulWidget {
  List<Admin_Tutor> systemtutors = [];
  Admin_View_Tutor(this.systemtutors);
  @override
  _Admin_View_TutorState createState() => _Admin_View_TutorState(systemtutors);
}

class _Admin_View_TutorState extends State<Admin_View_Tutor> {
  List<Admin_Tutor> systemtutors = [];
  bool showReload = false;
  _Admin_View_TutorState(this.systemtutors);
  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    return Scaffold(
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
      body: Builder(
        builder: (context) {
          return ModalProgressHUD(
            inAsyncCall: showReload,
            opacity: 0,
            progressIndicator: CircularProgressIndicator(),
            child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background.jpg"),
                      fit: deviceType == DeviceScreenType.desktop
                          ? BoxFit.fill
                          : BoxFit.cover)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (() {
                      if (systemtutors.length == 0) {
                        return Text("No teachers in the system yet :(");
                      } else
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                          child: new ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: new List.generate(
                                systemtutors.length,
                                (i) => new Admin_Tutor_CustomCard(
                                    systemtutors[i])),
                          ),
                        );
                    })(),
                  ],
                ),
              ),
            ),
          );
        }, /////////////////
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 80.0,
              child: DrawerHeader(
                child: Text('',
                    style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 35)),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/admin.png"),
                ),
                title: Text('Home' ,
                  style: TextStyle(
                    fontSize: 20,
                  ),),
                hoverColor: Colors.teal,
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Admin()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/logout.png"),
                ),
                title: Text('LogOut',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
                hoverColor: Colors.teal,
                onTap: () {
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
              ),
            ),
          ],
        ),
      ),
    ); //scaffold
  }
}
