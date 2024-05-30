import 'package:vehicle_care/Core/Dominio/modelos/User.dart';

class Reviews {
  final int id;
  final String description;
  final int score;
  final DateTime date;
  final Users id_user; 

  Reviews(
      {required this.id,
      required this.description,
      required this.score,
      required this.id_user,
      DateTime? date,})
      : date = date ?? DateTime.now();

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
      id: json['id'], 
      description: json['description'], 
      score: json['score'],
      id_user: json['id_user']);
  }
}
