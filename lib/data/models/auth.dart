class Auth {
  String? token;

  Auth({this.token});

  factory Auth.fromMap(Map<String, dynamic> json) => Auth(
        token: json['token'] as String,
      );
}
