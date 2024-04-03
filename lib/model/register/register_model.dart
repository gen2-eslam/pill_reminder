class RegisterModel {
  String name;
  String email;
  String password;
  String confirmPassword;
  String phone;

  RegisterModel({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['password_confirmation'] = confirmPassword;
    data['phone'] = phone;
    return data;
  }
  
}
