class Overview {
  final String? id;
  final String? name;
  final String? desc;
  final String? image;

  Overview({this.id, this.name, this.desc, this.image});

  factory Overview.fromJson(Map<String, dynamic> json) {
    return Overview(
      id: json['id'] as String?,
      name: json['name'] as String?,
      desc: json['desc'] as String?,
      image: json['image'] as String?,
    );
  }
}
