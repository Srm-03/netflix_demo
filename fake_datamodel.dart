class Fakeapi {
  int userId;
  int id;
  String title;
  String body;

  Fakeapi({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Fakeapi.fromJson(Map<String, dynamic> json) {
    return Fakeapi(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
