class UserModel {
  final String id;
  final String name;
  final String email;
  final String about;

  const UserModel({
    required this.id,
    required this.email,
    required this.about,
    required this.name,
  });

  UserModel copyWith({String? name, String? email, String? about}) {
    return UserModel(
        id: id,
        email: email ?? this.email,
        about: about ?? this.about,
        name: name ?? this.name);
  }

  UserModel fromMap(Map<String, dynamic> userMap) {
    return UserModel(
        id: userMap["\$id"],
        email: userMap['email'],
        about: userMap['about'],
        name: userMap['name']);
  }

  Map<String, dynamic> toMap() {
    return {"email": email, "name": name, "about": about};
  }
}
