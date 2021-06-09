// To parse this JSON data, do
//
//     final OnlineSession = OnlineSessionFromJson(jsonString);

import 'dart:convert';

OnlineSession OnlineSessionFromJson(String str) =>
    OnlineSession.fromJson(json.decode(str));

String OnlineSessionToJson(OnlineSession data) => json.encode(data.toJson());

class OnlineSession {
  OnlineSession({
    this.day,
    this.month,
    this.hour,
    this.minute,
    this.sessionDuration,
    this.studentsNum,
    this.service,
    this.student,
  });

  String day;
  String month;
  String hour;
  String minute;
  int sessionDuration;
  int studentsNum;
  String service;
  String student;

  factory OnlineSession.fromJson(Map<String, dynamic> json) => OnlineSession(
        day: json["day"],
        month: json["month"],
        hour: json["hour"],
        minute: json["minute"],
        sessionDuration: json["sessionDuration"],
        studentsNum: json["studentsNum"],
        service: json["service"],
        student: json["student"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "hour": hour,
        "sessionDuration": sessionDuration,
        "studentsNum": studentsNum,
        "service": service,
        "student": student,
        "minute": minute
      };
}
