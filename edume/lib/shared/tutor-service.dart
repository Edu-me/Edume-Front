import 'dart:convert';

Tutor_Service TutorServiceFromJson(String str) => Tutor_Service.fromJson(json.decode(str));
class Tutor_Service {
  String sId;
  bool availability;
  int rating;
  List<String> locations;
  Service service;
  String mode;

  Tutor_Service(
      {this.availability,
        this.rating,
        this.locations,
        this.service,
        this.mode});

  Tutor_Service.fromJson(Map<String, dynamic> json) {
    availability = json['availability'];
    rating = json['rating'];
    locations = json['locations'].cast<String>();
    service =
    json['service'] != null ? new Service.fromJson(json['service']) : null;
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['availability'] = this.availability;
    data['rating'] = this.rating;
    data['locations'] = this.locations;
    if (this.service != null) {
      data['service'] = this.service.toJson();
    }
    data['mode'] = this.mode;
    return data;
  }
}

class Service {
  String sId;
  Subject subject;
  Level level;
  SystemLanguage systemLanguage;
  int iV;

  Service({this.sId, this.subject, this.level, this.systemLanguage, this.iV});

  Service.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    subject =
    json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
    level = json['level'] != null ? new Level.fromJson(json['level']) : null;
    systemLanguage = json['systemLanguage'] != null
        ? new SystemLanguage.fromJson(json['systemLanguage'])
        : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.subject != null) {
      data['subject'] = this.subject.toJson();
    }
    if (this.level != null) {
      data['level'] = this.level.toJson();
    }
    if (this.systemLanguage != null) {
      data['systemLanguage'] = this.systemLanguage.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Subject {
  String sId;
  String subject;

  Subject({this.sId, this.subject});

  Subject.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    subject = json['subject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['subject'] = this.subject;
    return data;
  }
}

class Level {
  String sId;
  String level;

  Level({this.sId, this.level});

  Level.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['level'] = this.level;
    return data;
  }
}

class SystemLanguage {
  String sId;
  String language;

  SystemLanguage({this.sId, this.language});

  SystemLanguage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['language'] = this.language;
    return data;
  }
}