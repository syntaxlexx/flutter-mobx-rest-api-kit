import 'dart:math';

class User {
  String firstName, id;
  String? lastName, email, avatar;
  int followers = 0;

  User(
      {required this.firstName,
      this.lastName,
      this.email,
      this.avatar,
      required this.id,
      this.followers = 0});

  factory User.fromMap(Map<String, dynamic> json) => User(
        firstName: json['first_name'].toString(),
        lastName: json['last_name'].toString(),
        id: json['id'].toString(),
        email: json['email'].toString(),
        avatar: json['avatar'].toString(),
        followers: json['followers'] != null
            ? int.parse(json['followers'].toString())
            : Random().nextInt(200) + 10,
      );
}
