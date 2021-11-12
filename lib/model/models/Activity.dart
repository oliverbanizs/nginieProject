import 'dart:convert';

List<Activity> activityFromJson(String str) => List<Activity>.from(json.decode(str).map((x) => Activity.fromJson(x)));

String activityToJson(List<Activity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Activity {
  Activity({
    required this.id,
    required this.name,
    required this.desc,
    required this.image,
  });

  String id;
  String name;
  String desc;
  String image;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    desc: json["desc"] == null ? null : json["desc"],
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "desc": desc == null ? null : desc,
    "image": image == null ? null : image,
  };
}

class ActivityError {
  ActivityError({
    required this.code,
    required this.message,
  });

  int code;
  String message;

  factory ActivityError.fromJson(Map<String, dynamic> json) => ActivityError(
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "message": message == null ? null : message,
  };
}


