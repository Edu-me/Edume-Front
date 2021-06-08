class Admin_Tutor {
  String about;
  String sId;
  String email;
  String name;
  String phoneNumber;
  String nationality;
  List<Availability> availability;

  Admin_Tutor(
      {this.about,
        this.sId,
        this.email,
        this.name,
        this.phoneNumber,
        this.nationality,
        this.availability});

  Admin_Tutor.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    sId = json['_id'];
    email = json['email'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    nationality = json['nationality'];
    if (json['availability'] != null) {
      availability = new List<Availability>();
      json['availability'].forEach((v) {
        availability.add(new Availability.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.about;
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    data['nationality'] = this.nationality;
    if (this.availability != null) {
      data['availability'] = this.availability.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Availability {
  bool availabe;
  String sId;
  String day;

  Availability({this.availabe, this.sId, this.day});

  Availability.fromJson(Map<String, dynamic> json) {
    availabe = json['availabe'];
    sId = json['_id'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['availabe'] = this.availabe;
    data['_id'] = this.sId;
    data['day'] = this.day;
    return data;
  }
}
