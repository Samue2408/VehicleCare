import 'package:vehicle_care/Core/Dominio/modelos/Car.dart';
import 'package:vehicle_care/Core/Dominio/modelos/User.dart';

class NormalUser extends Users {
  NormalUser({
    required super.cars,
    required super.cellphone,
    required super.id,
    required super.name_o_email,
    required super.password,
    required super.type_user,
  });


  factory NormalUser.fromJson(Map<String, dynamic> json) {
    var carList = json['cars'] as List;
    List<Car> cars = carList.map((item) => Car.fromJson(item)).toList(); 

    return NormalUser(
        id: json['id'],
        name_o_email: json['name_o_email'],
        cellphone: json['cellphone'],
        password: json['password'],
        type_user: json['type_user'],
        cars: cars);
  }

}
