import 'package:vehicle_care/Core/Dominio/modelos/Car.dart';


class Users {
  final int id;
  final String name;
  final String email;
  final int cellphone;
  final String password;
  final List<Cars> cars;

  Users(
    {
      required this.id,
      required this.name,
      required this.email,
      required this.cellphone,
      required this.password,
      required this.cars,
    }
  );

  factory Users.fromJson(Map<String, dynamic> json) {

    var var_carslist = json['cars'] as List;
    List<Cars> cars_list = var_carslist.map((item) => Cars.fromJson(item)).toList();

    return Users(
      id: json['id'], 
      name: json['name'], 
      email: json['email'],
      cellphone: json['cellphone'],
      password: json['password'],
      cars: cars_list,
      );
  }
}