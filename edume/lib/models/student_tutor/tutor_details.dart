import 'dart:convert';

TutorAvailabilityDetails TutorAvailabilityDetailsFromJson(String str) =>
    TutorAvailabilityDetails.fromJson(json.decode(str));

String TutorAvailabilityDetailsToJson(TutorAvailabilityDetails data) =>
    json.encode(data.toJson());

class TutorAvailabilityDetails {
  TutorAvailabilityDetails({
    this.id,
    this.email,
    this.name,
    this.phoneNumber,
    this.nationality,
    this.availability,
    this.about,
  });

  String id;
  String email;
  String name;
  String phoneNumber;
  String nationality;
  List<Availability> availability;
  String about;

  factory TutorAvailabilityDetails.fromJson(Map<String, dynamic> json) =>
      TutorAvailabilityDetails(
        id: json["_id"],
        email: json["email"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        nationality: json["nationality"],
        availability: List<Availability>.from(
            json["availability"].map((x) => Availability.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
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
