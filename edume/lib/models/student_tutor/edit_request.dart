import 'dart:convert';

EditRequest EditRequestFromJson(String str) =>
    EditRequest.fromJson(json.decode(str));

String EditRequestToJson(EditRequest data) => json.encode(data.toJson());

class EditRequest {
  EditRequest({
    this.sessionDuration,
    this.studentsNum,
    this.day,
  });

  int sessionDuration;
  int studentsNum;
  String day;

  factory EditRequest.fromJson(Map<String, dynamic> json) => EditRequest(
        sessionDuration: json["sessionDuration"],
        studentsNum: json["studentsNum"],
        day: json["day"],
      );

  Map<String, dynamic> toJson() => {
        "sessionDuration": sessionDuration,
        "studentsNum": studentsNum,
        "day": day,
      };
}
