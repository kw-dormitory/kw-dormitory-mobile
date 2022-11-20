class PenaltyResponse {
  final List<Penalty> penalties;
  final int totalPenalty;

  PenaltyResponse({required this.penalties, required this.totalPenalty});

  factory PenaltyResponse.fromJson(Map<String, dynamic> json) {
    final list = json['penaltyItemList'] as List;
    List<Penalty> penalties = list.map((e) => Penalty.fromJson(e)).toList();
    return PenaltyResponse(
        penalties: penalties, totalPenalty: json['totalPenalty']);
  }
}

class Penalty {
  final String content;
  final String date;
  final int id;
  final int penalty;

  Penalty(
      {required this.content,
      required this.date,
      required this.id,
      required this.penalty});

  factory Penalty.fromJson(Map<String, dynamic> json) {
    return Penalty(
        content: json['content'],
        date: json['date'],
        id: json['id'],
        penalty: json['penalty']);
  }
}
