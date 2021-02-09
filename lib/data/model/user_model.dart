class UserModel {
  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
  });

  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        website: json["website"],
      );
}
