import 'dart:io';

class Car {
  final int id;
  final String brand;
  final String model;
  final DateTime year;
  final double mileage;
  final String type_of_file;
  final File file_image ;


  Car(
    {
      required this.id,
      required this.brand,
      required this.model,
      required this.year,
      required this.mileage,
      required this.type_of_file,
      required this.file_image,

    }
  );
/*
  factory User.fromJson(Map<String, dynamic> json){
    var tarea_list = json['tasks'] as List;
    List<Tasks> tareas = tarea_list.map((item) => Tasks.fronJson(item)).toList();
    return User(
      name: json['name'], 
      email: json['email'], 
      taskss: tareas,
    );
  }*/

}