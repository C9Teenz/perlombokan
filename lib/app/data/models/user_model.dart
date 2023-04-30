class UserModel {
  String name;

  UserModel({
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
