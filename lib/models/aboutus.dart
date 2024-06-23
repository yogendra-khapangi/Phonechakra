class AboutUsModel {
  AboutUsModel({
    required this.data,
  });

  final Data? data;

  factory AboutUsModel.fromJson(Map<String, dynamic> json) {
    return AboutUsModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  final int? id;
  final String? title;
  final String? description;
  final String? image;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      image: json["image"],
    );
  }
}
