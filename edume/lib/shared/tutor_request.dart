import 'package:edume/shared/tutor-service.dart';

class Tutor_Request {
  String message;
  String status;
  String sId;
  Student student;
  Service service;
  String sessionType;
  int sessionDuration;
  int studentsNum;
  String day;
  int iV;

  Tutor_Request(
      {this.message,
        this.status,
        this.sId,
        this.student,
        this.service,
        this.sessionType,
        this.sessionDuration,
        this.studentsNum,
        this.day,
        this.iV});

  Tutor_Request.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    sId = json['_id'];
    student =
    json['student'] != null ? new Student.fromJson(json['student']) : null;
    service =
    json['service'] != null ? new Service.fromJson(json['service']) : null;
    sessionType = json['sessionType'];
    sessionDuration = json['sessionDuration'];
    studentsNum = json['studentsNum'];
    day = json['day'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['_id'] = this.sId;
    if (this.student != null) {
      data['student'] = this.student.toJson();
    }
    if (this.service != null) {
      data['service'] = this.service.toJson();
    }
    data['sessionType'] = this.sessionType;
    data['sessionDuration'] = this.sessionDuration;
    data['studentsNum'] = this.studentsNum;
    data['day'] = this.day;
    data['__v'] = this.iV;
    return data;
  }
}

class Student {
  String sId;
  String email;
  String phoneNumber;
  String name;

  Student({this.sId, this.email, this.phoneNumber, this.name});

  Student.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['name'] = this.name;
    return data;
  }
}

