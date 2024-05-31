import 'package:vehicle_care/Core/Dominio/modelos/User.dart';

class Reviews {
  final int id;
  final String description;
  final int score;
  final String date;
  final int id_user; 

  Reviews(
      {required this.id,
      required this.description,
      required this.score,
      required this.id_user,
      required this.date});
      //: date = date ?? DateTime.now();

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
      id: json['id'], 
      description: json['description'], 
      score: json['score'],
      date: json['date'],
      id_user: json['id_user']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'score': score,
      'date': date,
      'id_user': id_user
    };
  }
}
