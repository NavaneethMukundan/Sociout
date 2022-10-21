class JobPostModel {
  String userId;
  String company;
  String place;
  String state;
  String country;
  String designation;
  String jobFor;
  String? expMin;
  String? expMax;
  String description;
  String vacancy;
  String jobType;
  num salaryMin;
  num salaryMax;
  String? image;

  JobPostModel({
    required this.company,
    required this.country,
    required this.description,
    required this.designation,
    this.expMax,
    this.expMin,
    this.image,
    required this.jobFor,
    required this.jobType,
    required this.place,
    required this.salaryMax,
    required this.salaryMin,
    required this.state,
    required this.userId,
    required this.vacancy,
  });

  Map<String, dynamic> tojson() {
    return {
      "userId": userId,
      "company": company,
      "company Place": place,
      "company State": state,
      "country": country,
      "discription": description,
      "designation": designation,
      "vacancy": vacancy,
      "expMin": expMin,
      "expMax": expMax,
      "image": image,
      "jobFor": jobFor,
      "jobType": jobType,
      "salaryMax": salaryMax,
      "salaryMin": salaryMin,
    };
  }
}
