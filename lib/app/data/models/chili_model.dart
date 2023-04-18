class ChiliModel {
  ChiliModel({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.shu,
    required this.scientificName,
    required this.image,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.categories,
  });

  int id;
  String name;
  int categoryId;
  String shu;
  String image;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  Categories categories;
  String scientificName;

  factory ChiliModel.fromJson(Map<String, dynamic> json) => ChiliModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        categoryId: json["categoryId"] ?? 1,
        shu: json["shu"] ?? "0",
        image: json["image"] ?? "",
        scientificName: json["scientificName"] ?? "",
        description: json["description"] ?? "",
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        categories: Categories.fromJson(json["categories"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "categoryId": categoryId,
        "shu": shu,
        "image": image,
        "scientificName": scientificName,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "categories": categories.toJson(),
      };
}

class Categories {
  Categories({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
