import 'package:flutter/material.dart';

class student_main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      /////////////////
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background1.jpg"),
                fit: BoxFit.cover)),
        child: Row(
          children: [
            SizedBox(width: 200.0, height: 100.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome, ",
                    style: TextStyle(fontSize: 30, color: Colors.white)),
                Text("Who are You looking for today? ",
                    style: TextStyle(fontSize: 60, color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: RaisedButton.icon(
                      elevation: 4.0,
                      icon: Image.asset(
                        'assets/tutor.png',
                        width: 100,
                        height: 80,
                      ),
                      color: Colors.transparent,
                      onPressed: () {},
                      label: Text("Tutors",
                          style:
                              TextStyle(color: Colors.white, fontSize: 30.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: RaisedButton.icon(
                        elevation: 4.0,
                        icon: Image.asset(
                          'assets/online tutor.jpg',
                          width: 100,
                          height: 80,
                        ),
                        color: Colors.transparent,
                        onPressed: () {},
                        label: Text("Online Tutors",
                            style: TextStyle(
                                color: Colors.white, fontSize: 30.0))),
                  ),
                ),
                // ignore: deprecated_member_use
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: RaisedButton.icon(
                        elevation: 4.0,
                        icon: Image.asset(
                          'assets/webinars.jpg',
                          width: 100,
                          height: 80,
                        ),
                        color: Colors.transparent,
                        onPressed: () {},
                        label: Text("Webinars",
                            style: TextStyle(
                                color: Colors.white, fontSize: 30.0))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      /////////////////
    );
  }
}
