import 'package:flutter/material.dart';

class TutorCard extends StatelessWidget {
  final bool offline;
  final String tutorName;
  final String phoneNumber;
  final String nationality;
  final List<String> locations;
  final int rating;
  final String id;
  TutorCard(
      {this.offline,
      this.nationality,
      this.phoneNumber,
      this.tutorName,
      this.id,
      this.locations,
      this.rating});
  @override
  Widget build(BuildContext context) {
    String tutorLocations;
    if (offline) {
      tutorLocations = locations[0];
      for (int i = 1; i < locations.length; i++) {
        tutorLocations += ", " + locations[i];
      }
    }
    return GestureDetector(
      onTap: () {
        // go to tutors details
      },
      child: Card(
        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/background.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tutorName,
                    style: TextStyle(color: Colors.orange, fontSize: 25),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    phoneNumber,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    nationality,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  offline
                      ? Text(
                          tutorLocations,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )
                      : Container(),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade800,
                        size: 15,
                      ),
                      Text(
                        rating.toString(),
                        style: TextStyle(color: Colors.black54),
                      )
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
