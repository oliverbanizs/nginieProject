
import 'dart:convert';

List<Inbox> inboxFromJson(String str) => List<Inbox>.from(json.decode(str).map((x) => Inbox.fromJson(x)));

String inboxToJson(List<Inbox> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Inbox {
  Inbox({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.image,
  });

  String id;
  String name;
  String lastMessage;
  String image;

  factory Inbox.fromJson(Map<String, dynamic> json) => Inbox(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    lastMessage: json["lastMessage"] == null ? null : json["lastMessage"],
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "lastMessage": lastMessage == null ? null : lastMessage,
    "image": image == null ? null : image,
  };
}

class InboxError {
  InboxError({
    required this.code,
    required this.message,
  });

  int code;
  String message;

  factory InboxError.fromJson(Map<String, dynamic> json) => InboxError(
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "message": message == null ? null : message,
  };
}
