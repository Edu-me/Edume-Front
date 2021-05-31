import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String serviceName;
  final String level;
  final String systemLanguage;
  final String id;
  final bool offline;

  ServiceCard(
      {this.serviceName,
      this.systemLanguage,
      this.id,
      this.offline,
      this.level});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // request tutors
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serviceName,
                      style: TextStyle(color: Colors.orange, fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text("System Language : ",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                        Text(systemLanguage,
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text("Level : ",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                        Text(level,
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
