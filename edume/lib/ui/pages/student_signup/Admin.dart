import 'package:flutter/material.dart';

class Admin extends StatelessWidget {
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

        ///////////////////
        body: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      child: DrawerHeader(
                        child: Text('Edume',
                            style: TextStyle(
                                color: Colors.blueAccent.withOpacity(1.0),
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("assets/register.jpg"),
                      ),
                      title: Text('Register a tutor'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("assets/tutor.png"),
                      ),
                      title: Text('Tutors'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("assets/students.jpg"),
                      ),
                      title: Text('Students'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("assets/logout.jpg"),
                      ),
                      title: Text('LogOut'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(width: 200),
              Container(
                  alignment: Alignment.center,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/admin2.jpg'),
                        Text('HELLO ADMIN',
                            style: TextStyle(
                                color: Colors.blueAccent.withOpacity(1.0),
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                      ]))
            ])); //scaffold
  }
}
