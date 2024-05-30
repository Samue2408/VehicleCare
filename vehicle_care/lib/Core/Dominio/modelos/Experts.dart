// ignore_for_file: camel_case_types, non_constant_identifier_names, use_super_parameters

import 'package:vehicle_care/Core/Dominio/modelos/Car.dart';
import 'package:vehicle_care/Core/Dominio/modelos/reviews.dart';

class U_expert{
  final int id;
  final String name;
  final String cellphone;
  String? work_Addres;
  String? speciliaty;
  DateTime? year_of_experience;
  final List<Reviews> reviews;

  U_expert({
    required this.id,
    required this.name,
    required this.cellphone,
    required this.work_Addres,
    required this.year_of_experience,
    required this.speciliaty,
    required this.reviews,
  });

  factory U_expert.fromJson(Map<String, dynamic> json) {

    var reviewsList = json['reviews'] as List;
    List<Reviews> reviews = reviewsList.map((item) => Reviews.fromJson(item)).toList(); 

    return U_expert(
        id: json['id'],
        name: json['name'],
        cellphone: json['cellphone'],
        work_Addres: json['work_Addres'],
        year_of_experience: json['year_of_experience'],
        speciliaty: json['speciliaty'],
        reviews: reviews);
  }
}
