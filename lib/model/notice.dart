class NoticeResponse {
  final List<Notice> notices;

  NoticeResponse({required this.notices});

  factory NoticeResponse.fromJson(List<dynamic> json) {
    List<Notice> notices = json.map((e) => Notice.fromJson(e)).toList();
    return NoticeResponse(notices: notices);
  }
}

class Notice {
  final int noticeId;
  final String title;
  final String writer;
  final String createdAt;

  Notice(
      {required this.noticeId,
      required this.title,
      required this.writer,
      required this.createdAt});

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
        noticeId: json["noticeId"],
        title: json["title"],
        writer: json["writer"],
        createdAt: json["createdAt"]);
  }
}

final emptyNotice = Notice(noticeId: -1, title: "", writer: "", createdAt: "");
