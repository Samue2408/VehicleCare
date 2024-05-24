import 'package:flutter/material.dart';
import 'package:vehicle_care/Presentation/Screens/CarScreen.dart';
import 'package:vehicle_care/Presentation/Screens/ExpertScreen.dart';
import 'package:vehicle_care/Presentation/Screens/MainScreen.dart';
import 'package:vehicle_care/Presentation/Screens/SearchScreen.dart';

Container Navbar(double screenHeight, double screenWidth, BuildContext context,
    {bool? inicio = false,
    bool? busqueda = false,
    bool? perfil = false,
    bool? carro = false}) {
  var colors = const Color.fromARGB(255, 54, 19, 161);
  return Container(
      margin: EdgeInsets.symmetric(
          vertical: screenHeight * 0.025, horizontal: screenWidth * 0.079),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff1B0950),
            Color(0xff050309),
          ],
        ),
      ),
      height: screenHeight * 0.074,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, MainScreen.routeName);
            },
            style: inicio!
                ? const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xff1B0950)))
                : null,
            isSelected: inicio,
            color: colors,
            icon: Icon(
              Icons.home,
              color: const Color.fromARGB(255, 255, 255, 255),
              size: !inicio ? 27.79 : 24,
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, SearchScreen.routeName);
              },
              style: busqueda!
                  ? const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xff1B0950)))
                  : null,
              isSelected: busqueda,
              color: colors,
              splashRadius: 10,
              icon: Icon(
                Icons.manage_search,
                color: const Color.fromARGB(255, 255, 255, 255),
                size: !busqueda ? 33.13 : 27.1,
              )),
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, ExpertScreen.routeName);
            },
            style: perfil!
                ? const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xff1B0950)))
                : null,
            color: colors,
            splashRadius: 10,
            isSelected: perfil,
            icon: Icon(
              Icons.manage_accounts,
              color: const Color.fromARGB(255, 255, 255, 255),
              size: !perfil ? 25.66 : 22.16,
            ),
          ),
          IconButton(
            style: carro!
                ? const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xff1B0950)))
                : null,
            onPressed: () {
              Navigator.pushReplacementNamed(context, CarScreen.routeName);
            },
            color: colors,
            isSelected: carro,
            splashRadius: 10,
            icon: Icon(
              Icons.directions_car,
              color: const Color.fromARGB(255, 255, 255, 255),
              size: !carro ? 24 : 21.71,
            ),
          ),
        ],
      ));
}
