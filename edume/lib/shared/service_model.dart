import 'dart:convert';

Service ServiceFromJson(String str) => Service.fromJson(json.decode(str));

String ServiceToJson(Service data) => json.encode(data.toJson());

class Service {
  Service({
    this.id,
    this.subject,
    this.level,
    this.systemLanguage,
  });

  String id;
  Subject subject;
  Level level;
  SystemLanguage systemLanguage;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["_id"],
        subject: Subject.fromJson(json["subject"]),
        level: Level.fromJson(json["level"]),
        systemLanguage: SystemLanguage.fromJson(json["systemLanguage"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "subject": subject.toJson(),
        "level": level.toJson(),
        "systemLanguage": systemLanguage.toJson(),
      };
}

class Level {
  Level({
    this.level,
  });

  String level;

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "level": level,
      };
}

class Subject {
  Subject({
    this.subject,
  });

  String subject;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        subject: json["subject"],
      );

  Map<String, dynamic> toJson() => {
        "subject": subject,
      };
}

class SystemLanguage {
  SystemLanguage({
    this.language,
  });

  String language;

  factory SystemLanguage.fromJson(Map<String, dynamic> json) => SystemLanguage(
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "language": language,
      };
}
