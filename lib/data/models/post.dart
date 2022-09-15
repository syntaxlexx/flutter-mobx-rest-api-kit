class Post {
  int? userId;
  int? id;
  String? title;
  String? body;
  String? image = 'https://placeimg.com/640/480/any';

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
    this.image,
  });

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        userId: json['userId'] != null
            ? int.parse(json['userId'].toString())
            : null,
        id: json['id'] != null ? int.parse(json['id'].toString()) : null,
        title: json['title'] as String,
        body: json['body'] as String,
        image: 'https://picsum.photos/id/${json['id']}/200/300',
      );

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
        'image': image,
      };
}
