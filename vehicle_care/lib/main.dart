import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_care/Presentation/Screens/my_app.dart';
import 'package:vehicle_care/theme/theme_provider.dart';
import 'package:vehicle_care/Core/Dominio/PreferenciaUsuario/UserPreferences.dart';

void main() async {
  final prefs = PreferenciaUsuario();
  await prefs.initPrefs();
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}
