import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
    print(response.headers);
    print(response.toString());
    print(response.headers['x-auth-token']);
    print(response.statusCode.toString());
    return [response.body,response.statusCode.toString()];
  }

  static Future<List<String>> Student_signUp(String email, String password,String name, String phone, String confirm) async {
    final String apiUrl = "http://localhost:3000/Edume/v1/auth/signup/student";
    final response = await http.post(apiUrl,
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        }, body: jsonEncode(<String, String>{
          "email" :email,
          "name":name,
          "password": password,
          "confirmPassword":confirm,
          "phoneNumber": phone
        }));
    print((jsonDecode(response.body)));
    return [response.body,response.statusCode.toString()];
  }

  static Future<List<String>> Tutor_Signup(String email, String password,String name, String phone, String confirm, String nationality) async {
    final String apiUrl = "http://localhost:3000/Edume/v1/auth/signup/tutor";
    final SharedPreferences shPr = await SharedPreferences.getInstance();
    final response = await http.post(apiUrl,
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': shPr.getString("token"),

        }, body: jsonEncode(<String, String>{
          "email" :email,
          "name":name,
          "password": password,
          "confirmPassword":confirm,
          "phoneNumber": phone,
          "nationality": nationality
        }));
    return [response.body,response.statusCode.toString()];
  }

  static void logout() async{
    final SharedPreferences shPr = await SharedPreferences.getInstance();
    shPr.remove("token");
  }

}