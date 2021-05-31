import 'package:edume/controllers/student_tutor/services_controller.dart';
import 'package:edume/models/student_tutor/service_model.dart';
import 'package:edume/ui/pages/student_tutor/set_tutor_selectors.dart';
import 'package:edume/widgets/service_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ServiceController serviceController = Get.put(ServiceController());

class student_main extends StatelessWidget {
  List<ServiceCard> servicesCards = [];
  Future<List<ServiceCard>> getServices(bool offline) async {
    // List<ServiceCard> pri_services = [];
    // List<ServiceCard> pre_services = [];
    // List<ServiceCard> sec_services = [];
    List<Service> services = await serviceController.getServices();

    for (int i = 0; i < services.length; i++) {
      ServiceCard serviceCard = new ServiceCard(
          offline: offline,
          id: (services)[i].id,
          serviceName: (services)[i].subject.subject,
          level: services[i].level.level,
          systemLanguage: (services)[i].systemLanguage.language);
      servicesCards.add(serviceCard);
    }
    // for (int i = 0; i < services[1].length; i++) {
    //   ServiceCard serviceCard = new ServiceCard(
    //       offline: offline,
    //       id: (services[1])[i].id,
    //       serviceName: (services[1])[i].subject.subject,
    //       systemLanguage: (services[1])[i].systemLanguage.language);
    //   pre_services.add(serviceCard);
    // }
    // for (int i = 0; i < services[2].length; i++) {
    //   ServiceCard serviceCard = new ServiceCard(
    //       offline: offline,
    //       id: (services[2])[i].id,
    //       serviceName: (services[2])[i].subject.subject,
    //       systemLanguage: (services[2])[i].systemLanguage.language);
    //   sec_services.add(serviceCard);
    // }
    // servicesCards.add(pri_services);
    // servicesCards.add(pre_services);
    // servicesCards.add(sec_services);
    return servicesCards;
  }

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
                image: AssetImage("assets/background.jpg"), fit: BoxFit.cover)),
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
                      onPressed: () async {
                        List<ServiceCard> services = await getServices(true);
                        print("request sent -------------------");
                        Get.to(SetTutorSelectors(
                          offline: true,
                          all_services: services,
                        ));
                      },
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
                        onPressed: () async {
                          List<ServiceCard> services = await getServices(false);
                          Get.to(SetTutorSelectors(
                            offline: false,
                            all_services: services,
                          ));
                        },
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
