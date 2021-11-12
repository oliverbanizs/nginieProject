import 'dart:convert';

List<Document> documentFromJson(String str) => List<Document>.from(json.decode(str).map((x) => Document.fromJson(x)));

String documentToJson(List<Document> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Document {
  Document({
    required this.id,
    required this.name,
    required this.desc,
    required this.image,
  });

  String id;
  String name;
  String desc;
  String image;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
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


DocError docErrorFromJson(String str) => DocError.fromJson(json.decode(str));

String docErrorToJson(DocError data) => json.encode(data.toJson());

class DocError {
  DocError({
    required this.code,
    required this.message,
  });

  int code;
  String message;

  factory DocError.fromJson(Map<String, dynamic> json) => DocError(
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "message": message == null ? null : message,
  };
}



