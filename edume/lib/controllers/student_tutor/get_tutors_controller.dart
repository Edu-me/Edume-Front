import 'package:edume/models/student_tutor/service_tutors_req.dart';
import 'package:edume/models/student_tutor/service_tutors_res.dart';
import 'package:edume/networking/student_tutor/student_tutor_services.dart';
import 'package:get/get.dart';

class GetTutorsController extends GetxController {
  List<ServiceTutorsResponse> tutors = [];
  StudentTutorServices studentTutorServices = new StudentTutorServices();
  Future<List<ServiceTutorsResponse>> getTutors(
      ServiceTutorsRequest serviceTutorsRequest) async {
    tutors = await studentTutorServices.getTutors(serviceTutorsRequest);
    return tutors;
  }
}
