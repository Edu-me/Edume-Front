// To parse this JSON data, do
//
//     final OfflineSession = OfflineSessionFromJson(jsonString);

import 'dart:convert';

OfflineSession OfflineSessionFromJson(String str) => OfflineSession.fromJson(json.decode(str));

String OfflineSessionToJson(OfflineSession data) => json.encode(data.toJson());

class OfflineSession {
    OfflineSession({
        this.day,
        this.month,
        this.hour,
        this.minute,
        this.sessionDuration,
        this.studentsNum,
        this.location,
        this.service,
        this.student,
    });

    String day;
    String month;
    String hour;
    String minute;
    int sessionDuration;
    int studentsNum;
    String location;
    String service;
    String student;

    factory OfflineSession.fromJson(Map<String, dynamic> json) => OfflineSession(
        day: json["day"],
        month: json["month"],
        hour: json["hour"],
        minute: json["minute"],
        sessionDuration: json["sessionDuration"],
        studentsNum: json["studentsNum"],
        location: json["location"],
        service: json["service"],
        student: json["student"],
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "hour": hour,
        "minute": minute,
        "sessionDuration": sessionDuration,
        "studentsNum": studentsNum,
        "location": location,
        "service": service,
        "student": student,
    };
}
