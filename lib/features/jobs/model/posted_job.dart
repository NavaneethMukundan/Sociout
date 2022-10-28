import 'dart:convert';

Postedjobsmodel postedjobsFromJson(String str) =>
    Postedjobsmodel.fromJson(json.decode(str));

class Postedjobsmodel {
  Postedjobsmodel({
    this.id,
    this.userId,
    this.company,
    this.place,
    this.state,
    this.country,
    this.designation,
    this.jobFor,
    this.description,
    this.vacancy,
    this.jobType,
    this.salaryMin,
    this.salaryMax,
    this.image,
    this.applicationStatus,
    this.isBlocked,
    this.isOpen,
    this.reportMessages,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? userId;
  String? company;
  String? place;
  String? state;
  String? country;
  String? designation;
  String? jobFor;
  String? description;
  String? vacancy;
  String? jobType;
  String? image;
  int? salaryMin;
  int? salaryMax;
  List<dynamic>? applicationStatus;
  bool? isBlocked;
  bool? isOpen;
  List<dynamic>? reportMessages;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Postedjobsmodel.fromJson(Map<String, dynamic> json) =>
      Postedjobsmodel(
        id: json["_id"],
        userId: json["userId"],
        company: json["company"],
        place: json["place"],
        state: json["state"],
        country: json["country"],
        designation: json["designation"],
        jobFor: json["jobFor"],
        description: json["description"],
        vacancy: json["vacancy"],
        jobType: json["jobType"],
        image: json["image"],
        salaryMin: json["salaryMin"],
        salaryMax: json["salaryMax"],
        applicationStatus:
            List<dynamic>.from(json["applicationStatus"].map((x) => x)),
        isBlocked: json["isBlocked"],
        isOpen: json["isOpen"],
        reportMessages:
            List<dynamic>.from(json["reportMessages"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}
