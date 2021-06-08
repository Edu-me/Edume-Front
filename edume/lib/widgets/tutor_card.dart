import 'package:edume/controllers/student_tutor/get_tutor_availability.dart';
import 'package:edume/ui/pages/student_tutor/prepare_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TutorCard extends StatelessWidget {
  final bool offline;
  final String tutorName;
  final String phoneNumber;
  final String nationality;
  final List<String> locations;
  final int rating;
  final String id;
  final String service_id;
  TutorCard(
      {this.offline,
      this.nationality,
      this.phoneNumber,
      this.tutorName,
      this.id,
      this.locations,
      this.rating,
      this.service_id});
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
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
              ],
            ),
            GestureDetector(
              onTap: () async {
                GetTutorAvailabilityController getTutorAvailabilityController =
                    Get.put(GetTutorAvailabilityController());
                List<String> availableDays =
                    await getTutorAvailabilityController
                        .getTutorAvailableDays(id);
                print(availableDays);
                Get.to(PrepareRequest(
                  offline: offline,
                  serviceId: service_id,
                  tutorId: id,
                  days: availableDays,
                  tutorName: tutorName,
                  edit: false,
                ));
              },
              child: Icon(
                Icons.send_to_mobile,
                color: Colors.green,
                size: 30,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
