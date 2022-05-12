class Users {
  late String id;
  late String name;
  late String birthdate;
  late String bio;
  late String phoneNumber;
  late String gender;
  late String email;
  late bool isUser;
  late final createdAt;
  Users(
      {required this.id,
      required this.bio,
      required this.isUser,
      required this.birthdate,
      required this.gender,
      required this.name,
      required this.email,
      required this.createdAt,
      required this.phoneNumber});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'birthdate': birthdate,
        'bio': bio,
        'phoneNumber': phoneNumber,
        'gender': gender,
        'isUser': isUser,
        'createdAt': createdAt,
      };

  Users.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    birthdate = json["birthdate"];
    bio = json["bio"];
    phoneNumber = json["phoneNumber"];
    gender = json["gender"];
    isUser = json["isUser"];
    createdAt = json["createdAt"];
  }
}
