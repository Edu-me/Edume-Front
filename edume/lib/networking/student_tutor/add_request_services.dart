import 'dart:convert';
import 'package:edume/models/student_tutor/add_request.dart';
import 'package:edume/models/student_tutor/edit_request.dart';
import 'package:edume/models/student_tutor/student_request.dart';
import 'package:edume/models/student_tutor/tutor_details.dart' as TD;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RequestServices {
  Future<TD.TutorAvailabilityDetails> getTutorDetails(String tutorID) async {
    Uri url =
        Uri.parse('http://localhost:3000/Edume/v1/system/services/$tutorID');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      List<TD.Availability> days = [];
      for (int i = 0;
          i < ((jsonDecode(response.body))["availability"]).length;
          i++) {
        TD.Availability availability = new TD.Availability(
            availabe: ((jsonDecode(response.body))["availability"])[i]
                ["availabe"],
            day: ((jsonDecode(response.body))["availability"])[i]["day"],
            id: ((jsonDecode(response.body))["availability"])[i]["_id"]);
        print(((jsonDecode(response.body))["availability"])[i]["availabe"]);
        if (((jsonDecode(response.body))["availability"])[i]["availabe"])
          days.add(availability);
      }
      TD.TutorAvailabilityDetails tutor = new TD.TutorAvailabilityDetails(
        availability: days,
        email: jsonDecode(response.body)["email"],
        id: jsonDecode(response.body)["_id"],
        name: jsonDecode(response.body)["name"],
        nationality: jsonDecode(response.body)["nationality"],
        phoneNumber: jsonDecode(response.body)["phoneNumber"],
      );
      return tutor;
    } else {
      // print(response.body);
      return null;
    }
  }

  Future<bool> sendRequest(AddRequestModel requestModel) async {
    final SharedPreferences shPr = await SharedPreferences.getInstance();
    String studentToken = shPr.getString("token");
    Uri url = Uri.parse('http://localhost:3000/Edume/v1/request');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': studentToken
        },
        body: jsonEncode(requestModel.toJson()));
    print(response.body);
    if (response.statusCode == 200) {
      Get.snackbar("Session Request Sent !", "",
          duration: Duration(seconds: 3));
      return true;
    } else {
      Get.snackbar("Something went wrong", "Try sending the request again",
          duration: Duration(seconds: 3));
      return false;
    }
  }

  Future<List<StudentRequest>> getRequests() async {
    final SharedPreferences shPr = await SharedPreferences.getInstance();
    String studentToken = shPr.getString("token");
    List<StudentRequest> requests = [];
    Uri url = Uri.parse('http://localhost:3000/Edume/v1/request/student');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': studentToken
      },
    );
    print(
        "get requests -----------------------------------------------------------------------------------------");
    print(response.body);
    if (response.statusCode == 200) {
      for (int j = 0; j < (jsonDecode(response.body)).length; j++) {
        //---------------------------------
        List<Availability> days = [];
        for (int i = 0;
            i <
                ((jsonDecode(response.body))[j]["tutor"]["availability"])
                    .length;
            i++) {
          Availability availability = new Availability(
              availabe: ((jsonDecode(response.body))[j]["tutor"]
                  ["availability"])[i]["availabe"],
              day: ((jsonDecode(response.body))[j]["tutor"]["availability"])[i]
                  ["day"],
              id: ((jsonDecode(response.body))[j]["tutor"]["availability"])[i]
                  ["_id"]);
          if (((jsonDecode(response.body))[j]["tutor"]["availability"])[i]
              ["availabe"]) days.add(availability);
        }
        //---------------------------------
        StudentRequest studentRequest = new StudentRequest(
          day: (jsonDecode(response.body))[j]["day"],
          id: (jsonDecode(response.body))[j]["_id"],
          message: (jsonDecode(response.body))[j]["message"],
          service: new Service(
              id: (jsonDecode(response.body))[j]["service"]["_id"],
              level: new Level(
                  level: jsonDecode(response.body)[j]["service"]["level"]
                      ["level"]),
              subject: new Subject(
                  subject: jsonDecode(response.body)[j]["service"]["subject"]
                      ["subject"]),
              systemLanguage: new SystemLanguage(
                  language: (jsonDecode(response.body))[j]["service"]
                      ["systemLanguage"]["language"])),
          sessionDuration: (jsonDecode(response.body))[j]["sessionDuration"],
          sessionType: (jsonDecode(response.body))[j]["sessionType"],
          status: (jsonDecode(response.body))[j]["status"],
          studentsNum: (jsonDecode(response.body))[j]["studentsNum"],
          tutor: new Tutor(
              about: (jsonDecode(response.body))[j]["tutor"]["about"],
              availability: days,
              email: (jsonDecode(response.body))[j]["tutor"]["email"],
              id: (jsonDecode(response.body))[j]["tutor"]["_id"],
              name: (jsonDecode(response.body))[j]["tutor"]["name"],
              nationality: (jsonDecode(response.body))[j]["tutor"]
                  ["nationality"]),
        );
        requests.add(studentRequest);
      }
    }
    return requests;
  }

  Future<bool> editRequest(EditRequest requestModel, String requestId) async {
    final SharedPreferences shPr = await SharedPreferences.getInstance();
    String studentToken = shPr.getString("token");
    Uri url =
        Uri.parse('http://localhost:3000/Edume/v1/request/details/$requestId');
    final response = await http.put(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': studentToken
        },
        body: jsonEncode(requestModel.toJson()));
    print(response.body);
    if (response.statusCode == 200) {
      Get.snackbar("Session Request Edited Successfully !", "",
          duration: Duration(seconds: 3));
      return true;
    } else {
      Get.snackbar("Something went wrong", "Try sending the request again",
          duration: Duration(seconds: 3));
      return false;
    }
  }
}
