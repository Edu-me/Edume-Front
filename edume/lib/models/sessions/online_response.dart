// To parse this JSON data, do
//
//     final OnlineSessionResponse = OnlineSessionResponseFromJson(jsonString);

import 'dart:convert';

OnlineSessionResponse OnlineSessionResponseFromJson(String str) => OnlineSessionResponse.fromJson(json.decode(str));

String OnlineSessionResponseToJson(OnlineSessionResponse data) => json.encode(data.toJson());

class OnlineSessionResponse {
    OnlineSessionResponse({
        this.day,
        this.month,
        this.hour,
        this.minute,
        this.id,
        this.sessionDuration,
        this.studentsNum,
        this.tutor,
        this.service,
        this.student,
        this.zoomMeeting,
        this.sessionTitle,
        this.v,
    });

    String day;
    String month;
    String hour;
    String minute;
    String id;
    int sessionDuration;
    int studentsNum;
    Tutor tutor;
    Service service;
    Student student;
    String zoomMeeting;
    String sessionTitle;
    int v;

    factory OnlineSessionResponse.fromJson(Map<String, dynamic> json) => OnlineSessionResponse(
        day: json["day"],
        month: json["month"],
        hour: json["hour"],
        minute: json["minute"],
        id: json["_id"],
        sessionDuration: json["sessionDuration"],
        studentsNum: json["studentsNum"],
        tutor: Tutor.fromJson(json["tutor"]),
        service: Service.fromJson(json["service"]),
        student: Student.fromJson(json["student"]),
        zoomMeeting: json["zoomMeeting"],
        sessionTitle: json["sessionTitle"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "hour": hour,
        "minute": minute,
        "_id": id,
        "sessionDuration": sessionDuration,
        "studentsNum": studentsNum,
        "tutor": tutor.toJson(),
        "service": service.toJson(),
        "student": student.toJson(),
        "zoomMeeting": zoomMeeting,
        "sessionTitle": sessionTitle,
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

class Student {
    Student({
        this.id,
        this.email,
        this.phoneNumber,
        this.name,
    });

    String id;
    String email;
    String phoneNumber;
    String name;

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["_id"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "phoneNumber": phoneNumber,
        "name": name,
    };
}

class Tutor {
    Tutor({
        this.about,
        this.id,
        this.email,
        this.name,
        this.phoneNumber,
        this.nationality,
        this.availability,
    });

    String about;
    String id;
    String email;
    String name;
    String phoneNumber;
    String nationality;
    List<Availability> availability;

    factory Tutor.fromJson(Map<String, dynamic> json) => Tutor(
        about: json["about"],
        id: json["_id"],
        email: json["email"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        nationality: json["nationality"],
        availability: List<Availability>.from(json["availability"].map((x) => Availability.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "about": about,
        "_id": id,
        "email": email,
        "name": name,
        "phoneNumber": phoneNumber,
        "nationality": nationality,
        "availability": List<dynamic>.from(availability.map((x) => x.toJson())),
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
