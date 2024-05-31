// ignore_for_file: unused_field, file_names
import 'package:shared_preferences/shared_preferences.dart';

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

  String get ultimapagina => _prefs.getString('ultimapagina') ?? 'Home';
  set ultimapagina(String value) => _prefs.setString('ultimapagina', value);
}
