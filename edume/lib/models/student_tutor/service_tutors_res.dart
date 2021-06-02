import 'dart:convert';

ServiceTutorsResponse ServiceTutorsResponseFromJson(String str) =>
    ServiceTutorsResponse.fromJson(json.decode(str));

String ServiceTutorsResponseToJson(ServiceTutorsResponse data) =>
    json.encode(data.toJson());

class ServiceTutorsResponse {
  ServiceTutorsResponse({
    this.rating,
    this.locations,
    this.tutor,
  });

  int rating;
  List<String> locations;
  Tutor tutor;

  factory ServiceTutorsResponse.fromJson(Map<String, dynamic> json) =>
      ServiceTutorsResponse(
        rating: json["rating"],
        locations: List<String>.from(json["locations"].map((x) => x)),
        tutor: Tutor.fromJson(json["tutor"]),
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "locations": List<dynamic>.from(locations.map((x) => x)),
        "tutor": tutor.toJson(),
      };
}

class Tutor {
  Tutor({
    this.id,
    this.name,
    this.phoneNumber,
    this.nationality,
  });

  String id;
  String name;
  String phoneNumber;
  String nationality;

  factory Tutor.fromJson(Map<String, dynamic> json) => Tutor(
        id: json["_id"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        nationality: json["nationality"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "phoneNumber": phoneNumber,
        "nationality": nationality,
      };
}
