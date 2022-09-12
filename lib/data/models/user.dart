class User {
  String name, id;
  String? email, avatar;
  int followers = 0;

  User(
      {required this.name,
      this.email,
      this.avatar,
      required this.id,
      this.followers = 0});

  factory User.fromMap(Map<String, dynamic> json) => User(
        name:
            "${json['first_name'].toString()} ${json['last_name'].toString()}",
        id: json['id'].toString(),
        email: json['email'].toString(),
        avatar: json['avatar'].toString(),
        followers: json['followers'] != null
            ? int.parse(json['followers'].toString())
            : 0,
      );
}
