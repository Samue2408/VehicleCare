// ignore_for_file: camel_case_types, non_constant_identifier_names, use_super_parameters

import 'package:vehicle_care/Core/Dominio/modelos/Car.dart';
import 'package:vehicle_care/Core/Dominio/modelos/User.dart';
import 'package:vehicle_care/Core/Dominio/modelos/reviews.dart';

class U_expert extends Users {
  String? work_Addres;
  String? speciliaty;
  DateTime? year_of_experience;
  final List<Reviews> reviews;

  U_expert({
    required super.id,
    required super.name_o_email,
    required super.cellphone,
    required super.password,
    required super.type_user,
    required super.cars,
    required this.work_Addres,
    required this.year_of_experience,
    required this.speciliaty,
    required this.reviews,
  });

  factory U_expert.fromJson(Map<String, dynamic> json) {
    var carList = json['cars'] as List;
    List<Car> cars = carList.map((item) => Car.fromJson(item)).toList();

    var reviewsList = json['reviews'] as List;
    List<Reviews> reviews = reviewsList.map((item) => Reviews.fromJson(item)).toList(); 

    return U_expert(
        id: json['id'],
        name_o_email: json['name_o_email'],
        cellphone: json['cellphone'],
        password: json['password'],
        type_user: json['type_user'],
        cars: cars,
        work_Addres: json['work_Addres'],
        year_of_experience: json['year_of_experience'],
        speciliaty: json['speciliaty'],
        reviews: reviews);
  }
}
