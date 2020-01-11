class PostList {
  final List<Post> post;

  PostList({this.post});

  factory PostList.fromJson(List<dynamic> parseJson) {
    List<Post> posts = new List<Post>();
    posts = parseJson.map((i) => Post.fromJson(i)).toList();

    return new PostList(post: posts);
  }
}

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"]);
  }
}
