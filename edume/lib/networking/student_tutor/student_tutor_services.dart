import 'dart:convert';
import 'package:edume/models/student_tutor/service_model.dart';
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
}
