// ignore_for_file: camel_case_types, non_constant_identifier_names, use_super_parameters

import 'package:vehicle_care/Core/Dominio/modelos/reviews.dart';

class U_expert{
  final int id;
  final String name;
  final int cellphone;
  String? work_Addres;
  String? speciliaty;
  int? year_of_experience;
  List<Reviews> reviews;

  U_expert({
    required this.id,
    required this.name,
    required this.cellphone,
    required this.work_Addres,
    required this.year_of_experience,
    required this.speciliaty,
    this.reviews = const [],
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

  Map<String, dynamic> toJson(){
    List<Map<String, dynamic>> expert_list = reviews.map((review) => review.toJson()).toList();

    return {
      'id': id,
      'name': name,
      'cellphone': cellphone,
      'work_Addres': work_Addres,
      'year_of_experience': year_of_experience,
      'speciliaty': speciliaty,
      'reviews': expert_list
    };
  }



}
