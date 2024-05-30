// ignore_for_file: camel_case_types, non_constant_identifier_names, use_super_parameters
import 'package:vehicle_care/Core/Dominio/modelos/Maintenance.dart';
import 'package:vehicle_care/Core/Dominio/modelos/User.dart';

class Cars {
  final int id;
  final String brand;
  final String model;
  final DateTime year;
  final int mileage;
  final String file_image;
  final Users id_user; 
  final List<Maintenances> maintenance; 


  Cars(
    {
      required this.id,
      required this.brand,
      required this.model,
      required this.year,
      required this.mileage,
      required this.file_image,
      required this.id_user,
      required this.maintenance,
    }
  );

  factory Cars.fromJson(Map<String, dynamic> json){

    var var_maintelist = json['maintenance'] as List;
    List<Maintenances> mainte_list = var_maintelist.map((item) => Maintenances.fromJson(item)).toList(); 


    return Cars(
      id: json['id'], 
      brand: json['brand'], 
      model: json['model'], 
      year: json['year'], 
      mileage: json['mileage'],  
      file_image: json['file_image'],
      id_user: json['id_user'],
      maintenance: mainte_list
      );
  }

}