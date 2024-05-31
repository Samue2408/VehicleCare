// ignore_for_file: non_constant_identifier_names

import 'package:vehicle_care/Core/Dominio/modelos/Service.dart';

class Maintenances {
  final int id;
  final Service service;
  final String description;
  final int mileage;

  //constructor
  Maintenances({
    required this.id,
    required this.service,
    required this.description,
    required this.mileage,
  });
//PENDIENTE REVISAR ENTRE MANTENIMIENTO Y SERVICIO --- NO LLEGA A SERVICIO
  factory Maintenances.fromJson(Map<String, dynamic> json) {
    var var_new_service = json['service'] as Map<String, dynamic>;
    Service new_service = Service.fromJson(var_new_service);
    
    return Maintenances(
        id: json['id'],
        description: json['description'],
        service: new_service,
        mileage: json['mileage']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> servi = service.toJson();

    return {
      'id': id,
      'description': description,
      'mileage': mileage,
      'service': service,
      'maintenance': servi
    };
  }
}
