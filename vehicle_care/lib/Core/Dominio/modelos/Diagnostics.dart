
// ignore_for_file: camel_case_types, non_constant_identifier_names, use_super_parameters

import 'package:vehicle_care/Core/Dominio/modelos/Solutions.dart';

class Diagnostics{
  final int id;
  final String symptoms;
  final String possible_causes;
  final List<Solutions> solutions;


  Diagnostics({
    required this.id,
    required this.symptoms,
    required this.possible_causes,
    required this.solutions
  });


  factory Diagnostics.fromJson(Map<String, dynamic> json) {

    var solutoins_List = json['solutions'] as List;
    List<Solutions> solutions = solutoins_List.map((item) => Solutions.fromJson(item)).toList(); 

    return Diagnostics(
        id: json['id'],
        symptoms: json['symptoms'],
        possible_causes: json['possible_causes'],
        solutions: solutions);
  }
}