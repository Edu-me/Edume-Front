import 'package:flutter/material.dart';
class StudentSignUp extends StatelessWidget {
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
                'assets/logo1.png',
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

      ),

    );
  }
}
