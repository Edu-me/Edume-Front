import 'package:edume/models/student_tutor/add_request.dart';
import 'package:edume/models/student_tutor/edit_request.dart';
import 'package:edume/models/student_tutor/student_request.dart';
import 'package:edume/networking/student_tutor/add_request_services.dart';
import 'package:edume/ui/pages/home_screen/student_main.dart';
import 'package:edume/ui/pages/student_tutor/track_requests.dart';
import 'package:get/get.dart';

class SendRequestController extends GetxController {
  RequestServices requestServices = new RequestServices();
  Future<void> sendRequest(AddRequestModel requestModel) async {
    bool requestStatus = await requestServices.sendRequest(requestModel);
    print(requestModel);
    if (requestStatus) {
      List<StudentRequest> requests = await requestServices.getRequests();
      Get.to(TrackRequests(
        requests: requests,
      ));
    } else
      Get.to(student_main());
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
