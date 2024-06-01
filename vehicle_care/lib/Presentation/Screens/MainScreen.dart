import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_care/Core/Dominio/PreferenciaUsuario/UserPreferences.dart';
import 'package:vehicle_care/Core/Dominio/modelos/Car.dart';
import 'dart:io';
import 'package:vehicle_care/Presentation/Screens/RegisterCarScreen.dart';
import 'package:vehicle_care/Presentation/Widgets/appbar_general.dart';
import 'package:vehicle_care/Presentation/Widgets/menuDrawer.dart';
import 'package:vehicle_care/Presentation/Widgets/navBar.dart';
import 'package:vehicle_care/theme/theme.dart';
import 'package:vehicle_care/theme/theme_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const String routeName = "MainScreen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

bool buttonSelected = false;

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final prefs = PreferenciaUsuario();

    ColorScheme colorTema = Theme.of(context).colorScheme;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final dynamic args = ModalRoute.of(context)!.settings.arguments;
    final int id = args as int;

    final Map<String, dynamic> user = prefs.listUser()[id - 1];

    return SafeArea(
      child: Scaffold(
        appBar: appbar_general(screenHeight, context),
        drawer: MenuDrawer(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.081, vertical: 32),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  colorTema.background,
                  colorTema.onBackground,
                ],
              ),
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My vehicles",
                          style: TextStyle(
                              color: colorTema.secondary,
                              fontWeight: FontWeight.w600),
                        ),
                        Container(
                          height: 28,
                          width: 42,
                          decoration: BoxDecoration(
                            color: const Color(0xffB8B8B8), // Color de fondo
                            borderRadius: BorderRadius.circular(
                                14), // Opcional: bordes redondeados
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, RegisterCarScreen.routeName);
                            },
                            icon: Icon(
                              Icons.add,
                              color: colorTema.primary,
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.0257,
                    ),
                    Container(
                      height: screenHeight*0.24*user['cars'].length,
                      width: screenWidth * 0.8,
                      child: ListView.builder(
                        itemCount: user['cars'].length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> car = user['cars'][index];
                          return Stack(
                            children: [
                              Container(                                  
                                padding: const EdgeInsets.all(13),
                                height: screenHeight * 0.24,
                                width: screenWidth * 0.8,
                                decoration: BoxDecoration(
                                  color: colorTema.primary,
                                  borderRadius: BorderRadius.circular(12.5)
                                ),
                                child: Text(
                                  "${car['brand']} ${car['model']} - ${car['year']}", // Ajusta esto según tus datos
                                  style: const TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.w400),
                                ),
                              ),
                              Positioned(
                                top: 47,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.5),
                                      image: DecorationImage(
                                        image: AssetImage('images/carro.png'),  //FileImage(File(car['file_image'])),
                                        fit: BoxFit.cover
                                      ),
                                    ),
                                  ),
                                
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.063,
                ),
                SizedBox(
                  width: screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Service Centers",
                        style: TextStyle(
                            color: colorTema.secondary,
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "Find a nearby service center",
                        style: TextStyle(
                            color: Color(0xffaaaaaa),
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: screenHeight * 0.019,
                      ),
                      Column(
                        children: [
                          centerServiceContainer(
                              colorTema, screenHeight, screenWidth, context),
                          centerServiceContainer(
                              colorTema, screenHeight, screenWidth, context),
                          centerServiceContainer(
                              colorTema, screenHeight, screenWidth, context),
                          centerServiceContainer(
                              colorTema, screenHeight, screenWidth, context),
                          centerServiceContainer(
                              colorTema, screenHeight, screenWidth, context)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.065,
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:
            Navbar(screenHeight, screenWidth, context, inicio: true),
      ),
    );
  }

  Container centerServiceContainer(ColorScheme colorTema, double screenHeight,
      double screenWidth, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.021),
      margin: const EdgeInsets.only(bottom: 14),
      height: screenHeight * 0.082,
      decoration: BoxDecoration(
        color: colorTema.tertiary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: screenHeight * 0.046,
            width: screenWidth * 0.116,
            decoration: BoxDecoration(
              color: Provider.of<ThemeProvider>(context).themeData == darkMode
                  ? colorTema.primary
                  : const Color(0xfff5eeee),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.location_on,
              size: screenHeight * 0.034,
              color: Provider.of<ThemeProvider>(context).themeData == darkMode
                  ? Colors.white
                  : colorTema.primary,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "AutoCare Service Center",
                style: TextStyle(
                    color: colorTema.secondary,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: screenWidth * 0.41,
                child: Text(
                  "Calle 77 # 22 - 75 Barranquilla-Atlántico",
                  style: TextStyle(
                      color: const Color(0xffABA3A3),
                      fontSize: screenHeight * 0.011),
                ),
              ),
            ],
          ),
          TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colorTema.primary)),
              child: Text("Directions",
                  style: TextStyle(
                      color: Colors.white, fontSize: screenHeight * 0.014)))
        ],
      ),
    );
  }
}
