import 'package:equatable/equatable.dart';

class NotificationModel extends Equatable {
  List<NotificationModelData>? data;
  Links? links;
  Meta? meta;
  String? message;
  int? code;
  String? type;

  NotificationModel(
      {this.data, this.links, this.meta, this.message, this.code, this.type});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <NotificationModelData>[];
      json['data'].forEach((v) {
        data!.add(NotificationModelData.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    message = json['message'];
    code = json['code'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['message'] = message;
    data['code'] = code;
    data['type'] = type;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [data, links, meta, message, code, type];
}

class NotificationModelData {
  String? id;
  String? createdAt;
  bool? seen;
  NotificationBodyModel? body;

  NotificationModelData({this.id, this.createdAt, this.seen, this.body});

  NotificationModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    seen = json['seen'];
    body = json['body'] != null
        ? NotificationBodyModel.fromJson(json['body'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['seen'] = seen;
    if (body != null) {
      data['body'] = body!.toJson();
    }
    return data;
  }
}

class NotificationBodyModel {
  bool? isClickable;
  String? notificationType;
  dynamic modelId;
  String? message;

  NotificationBodyModel(
      {this.isClickable, this.notificationType, this.modelId, this.message});

  NotificationBodyModel.fromJson(Map<String, dynamic> json) {
    isClickable = json['isClickable'];
    notificationType = json['notificationType'];
    modelId = json['modelId'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isClickable'] = isClickable;
    data['notificationType'] = notificationType;
    data['modelId'] = modelId;
    data['message'] = message;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  String? next;
  String? prev;

  Links({this.first, this.last, this.next, this.prev});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    next = json['next'];
    prev = json['prev'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    data['next'] = next;
    data['prev'] = prev;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;

  Meta({this.currentPage, this.from, this.lastPage});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    return data;
  }
}
