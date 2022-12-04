class PostResponse {
  final List<Post> posts;

  PostResponse({required this.posts});

  factory PostResponse.fromJson(List<dynamic> json) {
    List<Post> posts = json.map((e) => Post.fromJson(e)).toList();
    return PostResponse(posts: posts);
  }
}

class Post {
  final int id;
  final String title;
  final String content;
  final String date;
  final String opentalk;

  Post(
      {required this.id,
      required this.title,
      required this.content,
      required this.date,
      required this.opentalk});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        date: json["createdAt"],
        opentalk: json["openTokUrl"]);
  }
}
