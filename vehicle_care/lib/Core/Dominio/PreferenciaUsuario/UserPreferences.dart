// ignore_for_file: unused_field, file_names
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle_care/Core/Dominio/modelos/User.dart';

class PreferenciaUsuario {
  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static final PreferenciaUsuario _instancia = PreferenciaUsuario._internal();

  factory PreferenciaUsuario() {
    return _instancia;
  }

  PreferenciaUsuario._internal();

  String get nombre => _prefs.getString('nombre') ?? '';
  set nombre(String value) => _prefs.setString('nombre', value);

  String get user => _prefs.getString('user') ?? '';
  set user(String value) => _prefs.setString('user', value);

  String get expert => _prefs.getString('experts') ?? '';
  set expert(String value) => _prefs.setString('experts', value);

  String get ultimapagina => _prefs.getString('ultimapagina') ?? 'Home';
  set ultimapagina(String value) => _prefs.setString('ultimapagina', value);

  String get actualUser => _prefs.getString('actualUser') ?? '';
  set actualUser(String value) => _prefs.setString('actualUser', value);

  dynamic listUser() {
    String? usersJsonString = user;
    List<dynamic> usersJson = jsonDecode(usersJsonString);
    //List<Users> usersList =
    //  usersJson.map((userJson) => Users.fromJson(userJson)).toList();
    return usersJson;
  }

  dynamic addUser(Users usua) {
    List<dynamic> usersJson = listUser();
    List<Users> usersList =
        usersJson.map((userJson) => Users.fromJson(userJson)).toList();
    usersList.add(usua);

    String updatedUsersJsonString =
        jsonEncode(usersList.map((user) => user.toJson()).toList());
    user = updatedUsersJsonString;

    return listUser();
  }
}
