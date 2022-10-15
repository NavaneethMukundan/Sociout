class LoginResponse {
  String? id;
  String? name;
  String? email;
  String? token;
  bool? loggedin;
  bool? success;
  String? message;
  String? stack;
  num? status;

  LoginResponse(
      {this.id,
      this.email,
      this.loggedin,
      this.message,
      this.name,
      this.stack,
      this.status,
      this.success,
      this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json["message"] ?? "",
        token: json["token"] ?? "",
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        loggedin: json["loggedin"] ?? false,
        stack: json["stack"] ?? "",
        status: json["status"] ?? 0,
        success: json["success"] ?? false,
      );
}
