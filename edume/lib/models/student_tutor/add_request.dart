import 'dart:convert';

AddRequestModel AddRequestModelFromJson(String str) =>
    AddRequestModel.fromJson(json.decode(str));

String AddRequestModelToJson(AddRequestModel data) =>
    json.encode(data.toJson());

class AddRequestModel {
  AddRequestModel({
    this.tutor,
    this.student,
    this.service,
    this.sessionType,
    this.sessionDuration,
    this.studentsNum,
    this.day,
    this.message,
  });

  String tutor;
  String student;
  String service;
  String sessionType;
  int sessionDuration;
  int studentsNum;
  String day;
  String message;

  factory AddRequestModel.fromJson(Map<String, dynamic> json) =>
      AddRequestModel(
        tutor: json["tutor"],
        student: json["student"],
        service: json["service"],
        sessionType: json["sessionType"],
        sessionDuration: json["sessionDuration"],
        studentsNum: json["studentsNum"],
        day: json["day"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "tutor": tutor,
        "student": student,
        "service": service,
        "sessionType": sessionType,
        "sessionDuration": sessionDuration,
        "studentsNum": studentsNum,
        "day": day,
        "message": message,
      };
}
