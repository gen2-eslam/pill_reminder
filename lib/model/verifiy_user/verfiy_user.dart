class VerifyUser {
  String handle;
  int code;
  VerifyUser({
    required this.handle,
    required this.code,
  });

  Map<String, dynamic> toJson() {
    return {
      'handle': handle,
      'code': code,
    };
  }

  Map<String, dynamic> reSend() {
    return {
      'handle': handle,
    };
  }
}
