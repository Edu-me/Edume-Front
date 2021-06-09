import 'dart:convert';
import 'package:edume/models/sessions/offline_response.dart';
import 'package:edume/models/sessions/offline_session.dart';
import 'package:edume/models/sessions/online_response.dart';
import 'package:edume/models/sessions/online_session.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class Sessions {
  Future<void> submitOnlineSession(OnlineSession onlineSession) async {
    Uri url = Uri.parse('http://localhost:3000/Edume/v1/session/online');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userToken = sharedPreferences.getString("token");
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userToken
        },
        body: jsonEncode(onlineSession.toJson()));
    if (response.statusCode == 200) {
      Get.snackbar("Online Session was set successfully",
          "Check your sessions for the zoom link",
          duration: Duration(seconds: 3));
    } else {
      Get.snackbar("Offline Session was set successfully",
          "Check your sessions for the details",
          duration: Duration(seconds: 3));
    }
  }

  Future<void> submitOfflineSession(OfflineSession offlineSession) async {
    Uri url = Uri.parse('http://localhost:3000/Edume/v1/session/offline');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userToken = sharedPreferences.getString("token");
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userToken
        },
        body: jsonEncode(offlineSession.toJson()));
    if (response.statusCode == 200) {
      Get.snackbar("Offline Session was set successfully",
          "Check your sessions for the details",
          duration: Duration(seconds: 3));
    } else {
      Get.snackbar("Something went wrong", response.body,
          duration: Duration(seconds: 3));
    }
  }

  Future<List<List<dynamic>>> getSessions() async {
    List<List<dynamic>> sessions = [];
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userToken = sharedPreferences.getString("token");
    List<OnlineSessionResponse> onlineSessions = [];
    List<OfflineSessionResponse> offlineSessions = [];

    Uri url = Uri.parse('http://localhost:3000/Edume/v1/session');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userToken
      },
    );
    if (response.statusCode == 200) {
      var online = jsonDecode(response.body)["onlineSessions"];
      var offline = jsonDecode(response.body)["offlineSessions"];
      for (int i = 0; i < online.length; i++) {
        OnlineSessionResponse onlineSessionResponse =
            new OnlineSessionResponse.fromJson(online[i]);
        onlineSessions.add(onlineSessionResponse);
      }
      for (int i = 0; i < offline.length; i++) {
        OfflineSessionResponse offlineSessionResponse =
            new OfflineSessionResponse.fromJson(offline[i]);
        offlineSessions.add(offlineSessionResponse);
      }

      sessions.add(onlineSessions);
      sessions.add(offlineSessions);
      return sessions;
    } else {
      Get.snackbar("Something went wrong", response.body,
          duration: Duration(seconds: 3));
      return null;
    }
  }
}
