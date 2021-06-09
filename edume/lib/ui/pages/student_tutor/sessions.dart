import 'package:edume/main.dart';
import 'package:edume/models/sessions/offline_response.dart';
import 'package:edume/models/sessions/online_response.dart';
import 'package:edume/shared/auth.dart';
import 'package:edume/widgets/offline_session_card.dart';
import 'package:edume/widgets/online_session_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SessionPage extends StatefulWidget {
  List<OnlineSessionResponse> online;
  List<OfflineSessionResponse> offline;
  bool student;
  SessionPage({this.offline, this.online, this.student});

  @override
  _SessionPageState createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  List<OnlineSessionCard> online = [];
  List<OfflineSessionCard> offline = [];
  List<Widget> sessions = [];
  @override
  void initState() {
    for (int i = 0; i < widget.online.length; i++) {
      OnlineSessionCard onlineSessionCard = new OnlineSessionCard(
          session: widget.online[i], student: widget.student);
      sessions.add(onlineSessionCard);
    }
    for (int i = 0; i < widget.offline.length; i++) {
      OfflineSessionCard offlineSessionCard = new OfflineSessionCard(
          session: widget.offline[i], student: widget.student);
      sessions.add(offlineSessionCard);
    }
    // sessions.add(online);
    // sessions.add(offline);
  }

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
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: sessions.length > 0
                ? Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: sessions,
                    ),
                  )
                : Text("No Sessions Coming soon"),
          )),
    );
  }
}
