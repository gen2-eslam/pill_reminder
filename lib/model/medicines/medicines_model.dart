import 'dart:io';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

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
  int? id;
  String? name;
  String? type;
  int? count;
  int? takenCount;
  String? frequency;
  String? dosage;
  String? nextTakeTime;
  String? snoozeTill;
  bool? beforeEating;
  bool? shouldReminder;
  String? image;
  String? startTime;

  Medicines({
    this.id,
    this.name = "",
    this.type = "drink",
    this.count = 1,
    this.takenCount,
    this.frequency = "daily",
    this.dosage = "",
    this.nextTakeTime,
    this.snoozeTill,
    this.beforeEating = false,
    this.shouldReminder = false,
    this.image = "",
    this.startTime = "",
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
    data['type'] = "drink";
    data['count'] = count;
    data['frequency'] = frequency;
    data['dosage'] = dosage;
    data['before_eating'] = 1;
    data['should_reminder'] = 1;
    data['start_time'] = startTime;
    return data;
  }

  Future<Map<String, dynamic>> addMed({required File image}) async {
    String fileName = image.path.split('/').last;
    return {
      'name': name,
      'type': type,
      'count': count,
      'frequency': frequency,
      'dosage': dosage,
      'before_eating': beforeEating,
      'should_reminder': shouldReminder,
      'start_time': startTime,
      "image": await MultipartFile.fromFile(image.path, filename: fileName),
    };
  }

  @override
  String toString() {
    return '$name $type $count $frequency $dosage $beforeEating $shouldReminder $image $startTime';
  }
}
