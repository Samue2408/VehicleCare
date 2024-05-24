// ignore_for_file: camel_case_types, non_constant_identifier_names, use_super_parameters

import 'package:vehicle_care/Core/Dominio/modelos/User.dart';
import 'package:vehicle_care/Core/Dominio/modelos/reviews.dart';



class U_expert extends Users {

  String? work_Addres;
  String? speciliaty;
  DateTime? year_of_experience;
  final List<Reviews> reviews;

   U_expert(
    {
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
    }
  );

}
