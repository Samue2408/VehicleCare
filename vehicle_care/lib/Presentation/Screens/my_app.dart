import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_care/Presentation/Screens/CarScreen.dart';
import 'package:vehicle_care/Presentation/Screens/ExpertProfileScreen.dart';
import 'package:vehicle_care/Presentation/Screens/ExpertScreen.dart';
import 'package:vehicle_care/Presentation/Screens/FormKnowledge_Screen.dart';
import 'package:vehicle_care/Presentation/Screens/MainScreen.dart';
import 'package:vehicle_care/Presentation/Screens/PublishOpinionScreen.dart';
import 'package:vehicle_care/Presentation/Screens/RegisterCarScreen.dart';
import 'package:vehicle_care/Presentation/Screens/RegisterExpertScreen.dart';
import 'package:vehicle_care/Presentation/Screens/RegisterScreen.dart';
import 'package:vehicle_care/Presentation/Screens/SearchScreen.dart';
import 'package:vehicle_care/Presentation/Screens/Sign_in_Screen.dart';
import 'package:vehicle_care/Presentation/Screens/home_page.dart';
import 'package:vehicle_care/theme/theme_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        MyHomePage.routeName: (context) => const MyHomePage(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        RegisterCarScreen.routeName: (context) => const RegisterCarScreen(),
        RegisterExperts.routeName: (context) => const RegisterExperts(),
        MainScreen.routeName: (context) => const MainScreen(),
        CarScreen.routeName: (context) => const CarScreen(),
        Sign_In_.routeName: (context) => const Sign_In_(),
        QuestionsPage.routeName: (context) => const QuestionsPage(),
        SearchScreen.routeName: (context) => const SearchScreen(),
        ExpertScreen.routeName: (context) => const ExpertScreen(),
        ExpertProfile.routeName: (context) => const ExpertProfile(),
        PublishOpinionPage.routeName: (context) => const PublishOpinionPage()
      },
      home: const MyHomePage(),
    );
  }
}
