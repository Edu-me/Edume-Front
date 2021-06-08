import 'package:edume/models/student_tutor/tutor_details.dart';
import 'package:edume/networking/student_tutor/add_request_services.dart';
import 'package:get/get.dart';

class GetTutorAvailabilityController extends GetxController {
  RequestServices requestServices = new RequestServices();
  List<String> days = [];
  Future<List<String>> getTutorAvailableDays(String tutorID) async {
    TutorAvailabilityDetails tutor =
        await requestServices.getTutorDetails(tutorID);
    print(tutor);
    print("------------------------------");
    if (tutor != null)
      for (int i = 0; i < tutor.availability.length; i++) {
        days.add(tutor.availability[i].day);
      }
    print(days);
    return days;
  }
}
