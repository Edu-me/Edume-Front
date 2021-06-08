import 'dart:convert';

StudentRequest StudentRequestFromJson(String str) =>
    StudentRequest.fromJson(json.decode(str));

String StudentRequestToJson(StudentRequest data) => json.encode(data.toJson());

class StudentRequest {
  StudentRequest({
    this.message,
    this.status,
    this.id,
    this.tutor,
    this.service,
    this.sessionType,
    this.sessionDuration,
    this.studentsNum,
    this.day,
    this.v,
  });

  String message;
  String status;
  String id;
  Tutor tutor;
  Service service;
  String sessionType;
  int sessionDuration;
  int studentsNum;
  String day;
  int v;

  factory StudentRequest.fromJson(Map<String, dynamic> json) => StudentRequest(
        message: json["message"],
        status: json["status"],
        id: json["_id"],
        tutor: Tutor.fromJson(json["tutor"]),
        service: Service.fromJson(json["service"]),
        sessionType: json["sessionType"],
        sessionDuration: json["sessionDuration"],
        studentsNum: json["studentsNum"],
        day: json["day"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "_id": id,
        "tutor": tutor.toJson(),
        "service": service.toJson(),
        "sessionType": sessionType,
        "sessionDuration": sessionDuration,
        "studentsNum": studentsNum,
        "day": day,
        "__v": v,
      };
}

class Service {
  Service({
    this.id,
    this.subject,
    this.level,
    this.systemLanguage,
    this.v,
  });

  String id;
  Subject subject;
  Level level;
  SystemLanguage systemLanguage;
  int v;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["_id"],
        subject: Subject.fromJson(json["subject"]),
        level: Level.fromJson(json["level"]),
        systemLanguage: SystemLanguage.fromJson(json["systemLanguage"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "subject": subject.toJson(),
        "level": level.toJson(),
        "systemLanguage": systemLanguage.toJson(),
        "__v": v,
      };
}

class Level {
  Level({
    this.id,
    this.level,
  });

  String id;
  String level;

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        id: json["_id"],
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "level": level,
      };
}

class Subject {
  Subject({
    this.id,
    this.subject,
  });

  String id;
  String subject;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["_id"],
        subject: json["subject"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "subject": subject,
      };
}

class SystemLanguage {
  SystemLanguage({
    this.id,
    this.language,
  });

  String id;
  String language;

  factory SystemLanguage.fromJson(Map<String, dynamic> json) => SystemLanguage(
        id: json["_id"],
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "language": language,
      };
}

class Tutor {
  Tutor({
    this.about,
    this.id,
    this.email,
    this.name,
    this.nationality,
    this.availability,
    this.v,
  });

  String about;
  String id;
  String email;
  String name;
  String nationality;
  List<Availability> availability;
  int v;

  factory Tutor.fromJson(Map<String, dynamic> json) => Tutor(
        about: json["about"],
        id: json["_id"],
        email: json["email"],
        name: json["name"],
        nationality: json["nationality"],
        availability: List<Availability>.from(
            json["availability"].map((x) => Availability.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "about": about,
        "_id": id,
        "email": email,
        "name": name,
        "nationality": nationality,
        "availability": List<dynamic>.from(availability.map((x) => x.toJson())),
        "__v": v,
      };
}

class Availability {
  Availability({
    this.availabe,
    this.id,
    this.day,
  });

  bool availabe;
  String id;
  String day;

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        availabe: json["availabe"],
        id: json["_id"],
        day: json["day"],
      );

  Map<String, dynamic> toJson() => {
        "availabe": availabe,
        "_id": id,
        "day": day,
      };
}
