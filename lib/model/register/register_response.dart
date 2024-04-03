class RegisterResponse {
  String message;
  String type;
  int code;
  bool showToast;

  RegisterResponse({
    required this.message,
    required this.type,
    required this.code,
    required this.showToast,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        message: json["message"],
        type: json["type"],
        code: json["code"],
        showToast: json["showToast"],
      );
}

  // "data": null,
  // "message": "User Created Successfully and user verification sent",
  // "type": "success",
  // "code": 201,
  // "showToast": true