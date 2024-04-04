class ForgetPasswordModel {
  String email;
  String password;
  String confirmPassword;
  String code;
  ForgetPasswordModel(
      {required this.email,
      required this.password,
      required this.confirmPassword,
      required this.code});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['password_confirmation'] = confirmPassword;
    data['code'] = code;
    return data;
  }

  static sendEmail({required String email}) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['handle'] = email;
    return data;
  }
}
