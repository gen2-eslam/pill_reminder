class LogsModel {
  List<LogsData> date;

  LogsModel({
    required this.date,
  });

  factory LogsModel.fromJson(Map<String, dynamic> json) {
    return LogsModel(
      date: json['data']
          .map<LogsData>((json) => LogsData.fromJson(json))
          .toList(),
    );
  }
}

class LogsData {
  int id;
  String takenAt;
  LogsData({
    required this.id,
    required this.takenAt,
  });
  factory LogsData.fromJson(Map<String, dynamic> json) {
    return LogsData(
      id: json['id'],
      takenAt: json['taken_at'],
    );
  }
}
