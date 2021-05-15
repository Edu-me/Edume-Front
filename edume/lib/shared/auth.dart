import 'dart:convert';
import 'package:http/http.dart' as http;

class Auth {
  static bool user= false;
  static Future<List<String>> login(String email, String password,String role) async {
    final String apiUrl = "http://localhost:3000/Edume/v1/auth/login?role=$role";
    final response = await http.post(apiUrl,
        headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8'
    }, body: jsonEncode(<String, String>{
          'email': email,
          'password': password
        }));

   return [response.body,response.statusCode.toString()];
  }

  static Future<List<String>> Student_signUp(String email, String password,String name, String phone, String confirm) async {
    final String apiUrl = "http://localhost:3000/Edume/v1/auth/signup/student";
    final response = await http.post(apiUrl,
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8'
        }, body: jsonEncode(<String, String>{
          "email" :email,
          "name":name,
          "password": password,
          "confirmPassword":confirm,
          "phoneNumber": phone
        }));

    return [response.body,response.statusCode.toString()];
  }

}