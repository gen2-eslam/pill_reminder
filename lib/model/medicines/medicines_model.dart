class MedicinesModel {
  String message;
  int code;
  String type;
  List<Medicines> data;

  MedicinesModel({
    required this.message,
    required this.code,
    required this.type,
    required this.data,
  });

  factory MedicinesModel.fromJson(Map<String, dynamic> json) {
    return MedicinesModel(
      message: json['message'],
      code: json['code'],
      type: json['type'],
      data:
          List<Medicines>.from(json['data'].map((x) => Medicines.fromJson(x))),
    );
  }
}

class Medicines {
  int id;
  String name;
  String type;
  int count;
  int takenCount;
  String frequency;
  String dosage;
  String nextTakeTime;
  String? snoozeTill;
  bool beforeEating;
  bool shouldReminder;
  String image;
  String startTime;

  Medicines({
    required this.id,
    required this.name,
    required this.type,
    required this.count,
    required this.takenCount,
    required this.frequency,
    required this.dosage,
    required this.nextTakeTime,
    required this.snoozeTill,
    required this.beforeEating,
    required this.shouldReminder,
    required this.image,
    required this.startTime,
  });

  factory Medicines.fromJson(Map<String, dynamic> json) {
    return Medicines(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      count: json['count'],
      takenCount: json['taken_count'],
      frequency: json['frequency'],
      dosage: json['dosage'],
      nextTakeTime: json['next_take_time'],
      snoozeTill: json['snooze_till'],
      beforeEating: json['before_eating'],
      shouldReminder: json['should_reminder'],
      image: json['image'],
      startTime: json['start_time'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    data['count'] = count;
    data['frequency'] = frequency;
    data['dosage'] = dosage;
    data['before_eating'] = beforeEating;
    data['should_reminder'] = shouldReminder;
    data['start_time'] = startTime;
    return data;
  }
}
