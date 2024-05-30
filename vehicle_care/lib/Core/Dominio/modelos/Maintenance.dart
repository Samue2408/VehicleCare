import 'package:vehicle_care/Core/Dominio/modelos/Car.dart';
import 'package:vehicle_care/Core/Dominio/modelos/Service.dart';

class Maintenances{
  final int id;
  final Cars id_car;
  final Service id_service;
  final String description;
  final int mileage;

  //constructor
  Maintenances({
    required this.id,
    required this.id_car,
    required this.id_service,
    required this.description,
    required this.mileage,
  });

  factory Maintenances.fromJson(Map<String, dynamic> json){
    return Maintenances(
      id: json['id'],
      description: json['description'],
      id_car: json['id_cars'],
      id_service: json['id_service'],
      mileage: json['mileage']
    );
  }
}