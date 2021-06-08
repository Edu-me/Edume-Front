import 'package:edume/controllers/student_tutor/get_tutors_controller.dart';
import 'package:edume/models/student_tutor/add_request.dart';
import 'package:edume/models/student_tutor/edit_request.dart';
import 'package:edume/models/student_tutor/service_tutors_req.dart';
import 'package:edume/models/student_tutor/service_tutors_res.dart';
import 'package:edume/models/student_tutor/student_request.dart';
import 'package:edume/networking/student_tutor/add_request_services.dart';
import 'package:edume/ui/pages/student_tutor/track_requests.dart';
import 'package:edume/ui/pages/student_tutor/tutors_page.dart';
import 'package:get/get.dart';

class SendRequestController extends GetxController {
  RequestServices requestServices = new RequestServices();
  Future<void> sendRequest(AddRequestModel requestModel) async {
    bool requestStatus = await requestServices.sendRequest(requestModel);
    if (requestStatus) {
      List<StudentRequest> requests = await requestServices.getRequests();
      Get.to(TrackRequests(
        requests: requests,
      ));
    } else {
      List<ServiceTutorsResponse> tutors = [];
      ServiceTutorsRequest serviceTutorsRequest = new ServiceTutorsRequest(
          mode: requestModel.sessionType, service: requestModel.service);
      GetTutorsController getTutorsController = Get.put(GetTutorsController());

      tutors = await getTutorsController.getTutors(serviceTutorsRequest);
      Get.to(TutorPage(
        offline: (requestModel.sessionType == "offline") ? true : false,
        tutorsList: tutors,
        service_id: requestModel.service,
      ));
    }
  }

  Future<void> editRequest(EditRequest requestModel, String reuestID) async {
    bool requestStatus =
        await requestServices.editRequest(requestModel, reuestID);
    List<StudentRequest> requests = await requestServices.getRequests();
    Get.to(TrackRequests(
      requests: requests,
    ));
  }
}
