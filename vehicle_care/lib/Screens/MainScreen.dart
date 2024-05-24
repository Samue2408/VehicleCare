import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:vehicle_care/Screens/RegisterCarScreen.dart';
import 'package:vehicle_care/Widgets/appbar_general.dart';
import 'package:vehicle_care/Widgets/menuDrawer.dart';
import 'package:vehicle_care/Widgets/navBar.dart';
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
    ColorScheme colorTema = Theme.of(context).colorScheme;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final dynamic args = ModalRoute.of(context)!.settings.arguments;
    final File carro = args as File;

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
                    Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(12.5),
                            child: Container(
                              padding: const EdgeInsets.all(13),
                              height: screenHeight * 0.24,
                              width: screenWidth * 0.8,
                              color: colorTema.primary,
                              child: const Text(
                                "Dodge Challenger R/T - 2022",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            )),
                        Positioned(
                          top: 47,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.5),
                              child: Container(
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('images/carro.png'))),
                              )),
                        ),
                      ],
                    ),
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