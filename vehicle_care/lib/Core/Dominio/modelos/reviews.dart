class Reviews {
  final int id;
  final String description;
  final int score;
  final DateTime date;

  Reviews(
      {required this.id,
      required this.description,
      required this.score,
      DateTime? date})
      : date = date ?? DateTime.now();

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
      id: json['id'], 
      description: json['description'], 
      score: json['score']);
  }
}
