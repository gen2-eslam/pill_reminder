class NotificationModel {
  List<Data> data;
  Links links;
  Meta meta;
  String message;
  int code;
  String type;

  NotificationModel(
      {required this.data,
      required this.links,
      required this.meta,
      required this.message,
      required this.code,
      required this.type});

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
        links: Links.fromJson(json['links']),
        meta: Meta.fromJson(json['meta']),
        message: json['message'],
        code: json['code'],
        type: json['type'],
      );
}

class Data {
  String id;
  String title;
  String? image;
  String createdAt;
  bool seen;
  String body;
  DataData data;

  Data(
      {required this.id,
      required this.title,
      this.image,
      required this.createdAt,
      required this.seen,
      required this.body,
      required this.data});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        createdAt: json['created_at'],
        seen: json['seen'],
        body: json['body'],
        data: DataData.fromJson(json['data']),
      );
}

class DataData {
  int modelId;
  String type;

  DataData({required this.modelId, required this.type});

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        modelId: json['model_id'],
        type: json['type'],
      );
}

class Links {
  String first;
  String last;
  String next;
  String? prev;

  Links(
      {required this.first, required this.last, required this.next, this.prev});

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json['first'],
        last: json['last'],
        next: json['next'],
        prev: json['prev'],
      );
}

class Meta {
  int currentPage;
  int from;
  int lastPage;

  Meta({required this.currentPage, required this.from, required this.lastPage});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json['current_page'],
        from: json['from'],
        lastPage: json['last_page'],
      );
}
