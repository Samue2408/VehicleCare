import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_care/Screens/my_app.dart';
import 'package:vehicle_care/theme/theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}
