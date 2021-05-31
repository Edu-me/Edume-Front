import 'package:edume/models/student_tutor/service_model.dart';
import 'package:edume/networking/student_tutor/student_tutor_services.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController {
  List<Service> all_services = [];
  List<Service> pri_services = [];
  List<Service> pre_services = [];
  List<Service> sec_services = [];
  List<List<Service>> services_divided = [];
  StudentTutorServices studentTutorServices = new StudentTutorServices();
  Future<List<Service>> getServices() async {
    all_services = await studentTutorServices.getServices();
    // if (all_services != null)
    //   for (int i = 0; i < all_services.length; i++) {
    //     if (all_services[i].level == "Primiary")
    //       pri_services.add(all_services[i]);
    //     else if (all_services[i].level == "Preparatory")
    //       pre_services.add(all_services[i]);
    //     else
    //       sec_services.add(all_services[i]);
    //   }
    // services_divided.add(pri_services);
    // services_divided.add(pre_services);
    // services_divided.add(sec_services);

    return all_services;
  }
}
