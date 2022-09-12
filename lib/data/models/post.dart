class Post {
  int? userId;
  int? id;
  String? title;
  String? body;

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        userId: json['userId'] != null
            ? int.parse(json['userId'].toString())
            : null,
        id: json['id'] != null ? int.parse(json['id'].toString()) : null,
        title: json['title'] as String,
        body: json['body'] as String,
      );

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}
