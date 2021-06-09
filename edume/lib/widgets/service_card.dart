import 'package:edume/controllers/student_tutor/get_tutors_controller.dart';
import 'package:edume/models/student_tutor/service_tutors_req.dart';
import 'package:edume/models/student_tutor/service_tutors_res.dart';
import 'package:edume/shared/validate.dart';
import 'package:edume/ui/pages/student_tutor/tutors_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ServiceCard extends StatefulWidget {
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
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool showReload = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () async {
      setState(() {
        showReload = true;
      });
      List<ServiceTutorsResponse> tutors = [];
      ServiceTutorsRequest serviceTutorsRequest = new ServiceTutorsRequest(
          mode: widget.offline ? "offline" : "online", service: widget.id);
      GetTutorsController getTutorsController = Get.put(GetTutorsController());

      tutors = await getTutorsController.getTutors(serviceTutorsRequest);
      setState(() {
        showReload = false;
      });
      if (tutors != null) {
        print(tutors);
        Get.to(TutorPage(
          offline: widget.offline,
          tutorsList: tutors,
          service_id: widget.id,
        ));
      } else {
        Validate.showAlertDialog(context,
            "Unfortunately, there are no available tutors for this service currently \n please try again later, or try another one\n Thank you!");
      }
    }, child: Builder(
      builder: (context) {
        return SizedBox(
          height: 150,
          width: double.infinity,
          child: ModalProgressHUD(
            inAsyncCall: showReload,
            opacity: 0,
            progressIndicator: CircularProgressIndicator(),
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
                            widget.serviceName,
                            style:
                                TextStyle(color: Colors.orange, fontSize: 20),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text("System Language : ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15)),
                              Text(widget.systemLanguage,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15)),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text("Level : ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15)),
                              Text(widget.level,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }, /////////////////
    ));
  }
}
