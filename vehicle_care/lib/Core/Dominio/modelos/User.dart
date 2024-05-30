import 'package:vehicle_care/Core/Dominio/modelos/Car.dart';


class Users {
  final int id;
  final String name;
  final String email;
  final String cellphone;
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
}