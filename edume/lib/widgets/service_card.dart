import 'package:edume/controllers/student_tutor/get_tutors_controller.dart';
import 'package:edume/models/student_tutor/service_tutors_req.dart';
import 'package:edume/models/student_tutor/service_tutors_res.dart';
import 'package:edume/ui/pages/student_tutor/tutors_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      onTap: () async {
        List<ServiceTutorsResponse> tutors = [];
        ServiceTutorsRequest serviceTutorsRequest =
            new ServiceTutorsRequest(mode: offline.toString(), service: id);
        GetTutorsController getTutorsController =
            Get.put(GetTutorsController());

        tutors = await getTutorsController.getTutors(serviceTutorsRequest);
        Get.to(TutorPage(
          offline: offline,
          tutorsList: tutors,
        ));
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
