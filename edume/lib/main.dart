import 'package:edume/date_picker.dart';
import 'package:edume/ui/pages/home_screen/home.dart';
import 'package:edume/ui/pages/home_screen/student_main.dart';
import 'package:edume/ui/pages/login/login_desktop.dart';
import 'package:edume/ui/pages/login/login_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var id = prefs.getString('token');
  runApp(MyApp(
      id == null ? MyHomePage(title: 'Edume') : Home(prefs.getString('role'))));
}

class MyApp extends StatelessWidget {
  final Widget home;
  MyApp(this.home);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Edume',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: home);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: deviceType == DeviceScreenType.desktop
                    ? BoxFit.fill
                    : BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: RaisedButton(
                    hoverColor: Colors.lightBlue,
                    padding: EdgeInsets.all(30),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScreenTypeLayout.builder(
                                  mobile: (BuildContext context) =>
                                      Login_Mobile('student'),
                                  desktop: (BuildContext context) =>
                                      Login_Desktop('student'),
                                )),
                      );
                    },
                    child: Text(
                      "I'M STUDENT",
                      style: TextStyle(fontSize: 30),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: RaisedButton(
                    hoverColor: Colors.lightBlue,
                    padding: EdgeInsets.all(30),
                    onPressed: () {
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
                    child: Text(
                      "I'M TEACHER",
                      style: TextStyle(fontSize: 30),
                    )),
              ),
            ),
            // ignore: deprecated_member_use
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: RaisedButton(
                    hoverColor: Colors.lightBlue,
                    padding: EdgeInsets.all(30),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScreenTypeLayout.builder(
                                  mobile: (BuildContext context) =>
                                      Login_Mobile('admin'),
                                  desktop: (BuildContext context) =>
                                      Login_Desktop('admin'),
                                )),
                      );
                    },
                    child: Text(
                      "I'M ADMIN",
                      style: TextStyle(fontSize: 30),
                    )),
              ),
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
