import 'dart:convert';
import 'package:edume/models/student_tutor/service_model.dart';
import 'package:edume/models/student_tutor/service_tutors_req.dart';
import 'package:edume/models/student_tutor/service_tutors_res.dart';
import 'package:http/http.dart' as http;

class StudentTutorServices {
  Future<List<Service>> getServices() async {
    List<Service> services = [];
    Uri url = Uri.parse('http://localhost:3000/Edume/v1/system/services');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      for (int i = 0; i < (jsonDecode(response.body)).length; i++) {
        Service service = new Service();
        service.id = ((jsonDecode(response.body))[i])["_id"];
        service.level = new Level(
            level: ((jsonDecode(response.body))[i])["level"]["level"]);
        service.subject = new Subject(
            subject: ((jsonDecode(response.body))[i])["subject"]["subject"]);
        service.systemLanguage = new SystemLanguage(
            language: ((jsonDecode(response.body))[i])["systemLanguage"]
                ["language"]);
        services.add(service);
      }
      return services;
    } else
      return null;
  }

  Future<List<ServiceTutorsResponse>> getTutors(
      ServiceTutorsRequest serviceTutorsRequest) async {
    List<ServiceTutorsResponse> tutors = [];
    Uri url_online = Uri.parse(
        'http://localhost:3000/Edume/v1/system/services/online/tutors/${serviceTutorsRequest.service}');

    Uri url_offline = Uri.parse(
        'http://localhost:3000/Edume/v1/system/services/offline/tutors/${serviceTutorsRequest.service}');

    Uri url =
        (serviceTutorsRequest.mode == "offline") ? url_offline : url_online;
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      for (int i = 0; i < (jsonDecode(response.body)).length; i++) {
        ServiceTutorsResponse tutor = new ServiceTutorsResponse();
        tutor.locations = [];
        for (int j = 0;
            j < ((jsonDecode(response.body))[i]["locations"]).length;
            j++)
          tutor.locations.add(((jsonDecode(response.body))[i]["locations"])[j]);
        tutor.rating = (jsonDecode(response.body))[i]["rating"];
        tutor.tutor = new Tutor(
            id: (jsonDecode(response.body))[i]["tutor"]["_id"],
            name: (jsonDecode(response.body))[i]["tutor"]["name"],
            nationality: (jsonDecode(response.body))[i]["tutor"]["nationality"],
            phoneNumber: (jsonDecode(response.body))[i]["tutor"]
                ["phoneNumber"]);
        tutors.add(tutor);
      }
      return tutors;
    } else
      return null;
  }
}
