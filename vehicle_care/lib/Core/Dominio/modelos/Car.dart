// ignore_for_file: camel_case_types, non_constant_identifier_names, use_super_parameters
import 'package:vehicle_care/Core/Dominio/modelos/Maintenance.dart';
import 'package:vehicle_care/Core/Dominio/modelos/User.dart';

class Cars {
  final int id;
  final String brand;
  final String model;
  final int year;
  final int mileage;
  final String file_image;
  final List<Maintenances> maintenance;

  Cars({
    required this.id,
    required this.brand,
    required this.model,
    required this.year,
    required this.mileage,
    required this.file_image,
    required this.maintenance,
  });

  factory Cars.fromJson(Map<String, dynamic> json) {
    var var_maintelist = json['maintenance'] as List;
    List<Maintenances> mainte_list =
        var_maintelist.map((item) => Maintenances.fromJson(item)).toList();

    return Cars(
        id: json['id'],
        brand: json['brand'],
        model: json['model'],
        year: json['year'],
        mileage: json['mileage'],
        file_image: json['file_image'],
        maintenance: mainte_list);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> maintenance_list =
        maintenance.map((mainte) => mainte.toJson()).toList();

    return {
      'id': id,
      'brand': brand,
      'model': model,
      'year': year,
      'mileage': mileage,
      'file_image': file_image,
      'maintenance': maintenance_list
    };
  }
}
