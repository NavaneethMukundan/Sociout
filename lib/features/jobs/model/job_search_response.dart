class JobSearchModelResponse {
  bool? success;
  num? status;
  String? message;
  String? stack;
  String? userId;
  String? company;
  String? place;
  String? state;
  String? country;
  String? designation;
  String? jobFor;
  String? expMin;
  String? expMax;
  String? description;
  String? vacancy;
  String? jobType;
  String? salaryMin;
  String? salaryMax;
  String? image;

  JobSearchModelResponse({
    this.message,
    this.stack,
    this.status,
    this.success,
    this.company,
    this.country,
    this.description,
    this.designation,
    this.expMax,
    this.expMin,
    this.image,
    this.jobFor,
    this.jobType,
    this.place,
    this.salaryMax,
    this.salaryMin,
    this.state,
    this.userId,
    this.vacancy,
  });

  factory JobSearchModelResponse.fromJson(Map<String, dynamic> json) =>
      JobSearchModelResponse(
          message: json["message"] ?? '',
          success: json["success"] ?? false,
          stack: json["stack"] ?? '',
          status: json["status"] ?? 0,
          company: json["company"] ?? '',
          country: json["country"] ?? '',
          description: json["description"] ?? '',
          designation: json["designation"] ?? '',
          expMax: json["expMax"] ?? '',
          expMin: json["expMin"] ?? '',
          image: json["image"] ?? '',
          jobFor: json["jobFor"] ?? '',
          jobType: json["jobType"] ?? '',
          place: json["place"] ?? '',
          salaryMax: json["salaryMax"] ?? '',
          salaryMin: json["salaryMin"] ?? '',
          state: json["state"] ?? '',
          userId: json["userId"] ?? '',
          vacancy: json["vacancy"] ?? '');
}
