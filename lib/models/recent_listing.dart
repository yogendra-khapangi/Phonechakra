class RecentlylistingModel {
  RecentlylistingModel({
    required this.data,
  });

  final List<Datum> data;

  factory RecentlylistingModel.fromJson(Map<String, dynamic> json) {
    return RecentlylistingModel(
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  Datum({
    required this.id,
    required this.category,
    required this.type,
    required this.tag,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.municipality,
    required this.facebook,
    required this.twitter,
    required this.instagram,
    required this.linkedin,
    required this.website,
    required this.about,
    required this.profileImage,
  });

  final int? id;
  final String? category;
  final String? type;
  final String? tag;
  final String? name;
  final String? phone;
  final String? email;
  final String? address;
  final String? municipality;
  final String? facebook;
  final String? twitter;
  final String? instagram;
  final String? linkedin;
  final String? website;
  final String? about;
  final String? profileImage;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      category: json["category"],
      type: json["type"],
      tag: json["tag"],
      name: json["name"],
      phone: json["phone"],
      email: json["email"],
      address: json["address"],
      municipality: json["municipality"],
      facebook: json["facebook"],
      twitter: json["twitter"],
      instagram: json["instagram"],
      linkedin: json["linkedin"],
      website: json["website"],
      about: json["about"],
      profileImage: json["profile_image"],
    );
  }
}
