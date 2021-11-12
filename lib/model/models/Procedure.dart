import 'dart:convert';

List<Procedure> procedureFromJson(String str) => List<Procedure>.from(json.decode(str).map((x) => Procedure.fromJson(x)));

String procedureToJson(List<Procedure> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Procedure {
  Procedure({
    required this.id,
    required this.name,
    required this.desc,
    required this.image,
  });

  String id;
  String name;
  String desc;
  String image;

  factory Procedure.fromJson(Map<String, dynamic> json) => Procedure(
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
class ProcedureError {
  ProcedureError({
    required this.code,
    required this.message,
  });

  int code;
  String message;

  factory ProcedureError.fromJson(Map<String, dynamic> json) => ProcedureError(
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "message": message == null ? null : message,
  };
}

