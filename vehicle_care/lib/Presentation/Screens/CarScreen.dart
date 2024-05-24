import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_care/Presentation/Widgets/appbar_general.dart';
import 'package:vehicle_care/Presentation/Widgets/menuDrawer.dart';
import 'package:vehicle_care/Presentation/Widgets/navBar.dart';
import 'package:vehicle_care/theme/theme.dart';
import 'package:vehicle_care/theme/theme_provider.dart';

class CarScreen extends StatefulWidget {
  const CarScreen({super.key});

  static const String routeName = "CarScreen";

  @override
  State<CarScreen> createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorTema = Theme.of(context).colorScheme;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: colorTema.onBackground,
        appBar: appbar_general(screenHeight, context),
        drawer:
            MenuDrawer(screenHeight: screenHeight, screenWidth: screenWidth),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.078, vertical: 32),
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
                        const Text(
                          "Dodge Challenger R/T - 2022",
                          style: TextStyle(
                              color: Color(0xff787878),
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "5,005 miles",
                          style: TextStyle(
                              color: colorTema.secondary,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.0085,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(12.5),
                        child: Container(
                          height: screenHeight * 0.21,
                          width: screenWidth * 0.8,
                          color: colorTema.primary,
                          child: Image.asset(
                            'images/carro.png',
                            fit: BoxFit.cover,
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.035,
                ),
                SizedBox(
                  width: screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recommended Maintenance",
                        style: TextStyle(
                            color: colorTema.secondary,
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight * 0.021),
                      ),
                      Text("Based on your vehicle's mileage",
                          style: TextStyle(
                              color: const Color(0xffB8B8B8),
                              fontWeight: FontWeight.w600,
                              fontSize: screenHeight * 0.011)),
                      Divider(
                        color: Provider.of<ThemeProvider>(context).themeData ==
                                darkMode
                            ? colorTema.primary
                            : const Color(0xffb8b8b8),
                      ),
                      maintenanceInfo(screenWidth, context, colorTema,
                          screenHeight, "Oil Service"),
                      maintenanceInfo(screenWidth, context, colorTema,
                          screenHeight, "Break Inspection"),
                      maintenanceInfo(screenWidth, context, colorTema,
                          screenHeight, "Break Pad Replacement"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:
            Navbar(screenHeight, screenWidth, context, carro: true),
      ),
    );
  }

  Container maintenanceInfo(double screenWidth, BuildContext context,
      ColorScheme colorTema, double screenHeight, String maintenance) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.028),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            maintenance,
            style: TextStyle(
                color: Provider.of<ThemeProvider>(context).themeData == darkMode
                    ? Colors.white
                    : colorTema.primary,
                fontSize: screenHeight * 0.019,
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                "Interval:\nLast:\nNext:",
                style: TextStyle(
                    fontSize: screenHeight * 0.013,
                    color: const Color(0xffb8b8b8),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: screenHeight * 0.011,
              ),
              Text(
                "5,000 miles\n25,000 miles\n30,000 miles",
                style: TextStyle(
                    fontSize: screenHeight * 0.013,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
