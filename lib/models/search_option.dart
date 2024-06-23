class SearchOptionsModel {
  SearchOptionsModel({
    required this.data,
  });

  final List<String> data;

  factory SearchOptionsModel.fromJson(Map<String, dynamic> json) {
    return SearchOptionsModel(
      data: json["data"] == null
          ? []
          : List<String>.from(json["data"]!.map((x) => x)),
    );
  }
}
