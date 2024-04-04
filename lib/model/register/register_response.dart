class AuthResponse {
  String message;
  Map<String, dynamic>? data;
  String type;
  int code;
  bool showToast;

  AuthResponse({
    required this.message,
    required this.type,
    required this.code,
    this.data,
    required this.showToast,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        message: json["message"],
        type: json["type"],
        code: json["code"],
        data: json["data"],
        showToast: json["showToast"],
      );
}

  // "data": null,
  // "message": "User Created Successfully and user verification sent",
  // "type": "success",
  // "code": 201,
  // "showToast": true