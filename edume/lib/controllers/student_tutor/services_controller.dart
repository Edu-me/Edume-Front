import 'package:edume/models/student_tutor/service_model.dart';
import 'package:edume/networking/student_tutor/student_tutor_services.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController {
  List<Service> all_services = [];
  StudentTutorServices studentTutorServices = new StudentTutorServices();
  Future<List<Service>> getServices() async {
    all_services = await studentTutorServices.getServices();
    return all_services;
  }
}
