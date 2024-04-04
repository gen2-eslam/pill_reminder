class PersonalDataModel {
  PersonalData personalData;
  String message;
  String type;
  int code;
  bool showToast;

  PersonalDataModel(
      {required this.personalData,
      required this.message,
      required this.type,
      required this.code,
      required this.showToast});

  factory PersonalDataModel.fromJson(Map<String, dynamic> json) {
    return PersonalDataModel(
      message: json["message"],
      type: json["type"],
      code: json["code"],
      showToast: json["showToast"],
      personalData: PersonalData.fromJson(json['data']),
    );
  }
}

class PersonalData {
  int id;
  String name;
  bool status;
  String phone;
  String email;
  String avatar;
  String type;
  String token;
  PersonalData({
    required this.id,
    required this.name,
    required this.status,
    required this.phone,
    required this.email,
    required this.avatar,
    required this.type,
    required this.token,
  });
  factory PersonalData.fromJson(Map<String, dynamic> json) {
    return PersonalData(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      phone: json['phone'],
      email: json['email'],
      avatar: json['avatar'],
      type: json['type'],
      token: json['token'],
    );
  }
}
