class UserModel {
  final String id;
  final String name;
  final String email;
  final String about;
  final String? profileUrl;

  const UserModel(
      {required this.id,
      required this.email,
      required this.about,
      required this.name,
      this.profileUrl});

  UserModel copyWith({
    String? name,
    String? email,
    String? about,
    String? profileUrl,
  }) {
    return UserModel(
      id: id,
      email: email ?? this.email,
      about: about ?? this.about,
      name: name ?? this.name,
      profileUrl: profileUrl ?? this.profileUrl,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> userMap) {
    return UserModel(
      id: userMap["\$id"],
      email: userMap['email'],
      about: userMap['about'],
      name: userMap['name'],
      profileUrl: userMap["profileUrl"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "name": name,
      "about": about,
      "profileUrl": profileUrl
    };
  }
}
