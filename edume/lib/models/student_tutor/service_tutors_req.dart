import 'dart:convert';

ServiceTutorsRequest ServiceTutorsRequestFromJson(String str) =>
    ServiceTutorsRequest.fromJson(json.decode(str));

String ServiceTutorsRequestToJson(ServiceTutorsRequest data) =>
    json.encode(data.toJson());

class ServiceTutorsRequest {
  ServiceTutorsRequest({
    this.mode,
    this.service,
  });

  String mode;
  String service;

  factory ServiceTutorsRequest.fromJson(Map<String, dynamic> json) =>
      ServiceTutorsRequest(
        mode: json["mode"],
        service: json["service"],
      );

  Map<String, dynamic> toJson() => {
        "mode": mode,
        "service": service,
      };
}
