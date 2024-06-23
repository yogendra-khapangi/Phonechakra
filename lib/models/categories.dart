class CategoriesModel {
  CategoriesModel({
    required this.data,
  });

  final List<Datum> data;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.slug,
    required this.totalListings,
    required this.totalCities,
    required this.listings,
  });

  final int? id;
  final String? title;
  final String? slug;
  final int? totalListings;
  final int? totalCities;
  final List<Listing> listings;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      title: json["title"],
      slug: json["slug"],
      totalListings: json["total_listings"],
      totalCities: json["total_cities"],
      listings: json["listings"] == null
          ? []
          : List<Listing>.from(
              json["listings"]!.map((x) => Listing.fromJson(x))),
    );
  }
}

class Listing {
  Listing({
    required this.id,
    required this.category,
    required this.type,
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

  factory Listing.fromJson(Map<String, dynamic> json) {
    return Listing(
      id: json["id"],
      category: json["category"],
      type: json["type"],
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
