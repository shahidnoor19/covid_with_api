class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;
  PostModel({
    this.body,
    this.id,
    this.title,
    this.userId,
  });
  factory PostModel.formJson(var json) {
    return PostModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
