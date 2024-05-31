// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:vehicle_care/Presentation/Screens/MainScreen.dart';
import 'package:vehicle_care/Presentation/Widgets/camposTexto.dart';

class RegisterCarScreen extends StatefulWidget {
  const RegisterCarScreen({super.key});

  static const String routeName = "registerCar";

  @override
  State<RegisterCarScreen> createState() => _RegisterCarScreenState();
}

class _RegisterCarScreenState extends State<RegisterCarScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  File? imagePath;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff0D0C0C),
                Color(0xff050309),
              ],
            ),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Register Car',
                      style: TextStyle(
                        fontFamily: 'Bruno Ace',
                        fontSize: screenHeight * 0.04,
                        color: Colors.white,
                      )),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 41),
                    child: Text(
                      'Register your vehicle now and let VehicleCare accompany you every mile of your journey.',
                      style: TextStyle(
                        fontSize: screenHeight * 0.016,
                        color: const Color.fromRGBO(255, 255, 255, 0.7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  camposTexto(
                      'Brand', Icons.directions_car, TextInputType.name, nameController),
                  camposTexto(
                      'Model', Icons.type_specimen, TextInputType.emailAddress, userController),
                  camposTexto('Year', Icons.calendar_month_rounded,
                      TextInputType.phone, phoneController),
                  camposTexto('Mileage', Icons.speed, TextInputType.number, passwordController),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  IconButton(
                      onPressed: () {
                        _pickImageFromGallery();
                      },
                      icon: (imagePath == null)
                          ? Container(
                              height: screenHeight * 0.25,
                              width: screenWidth * 0.58,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color:
                                      const Color.fromRGBO(217, 217, 217, 0.2)),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.cloud_upload,
                                    color: Color.fromRGBO(255, 255, 255, 0.1),
                                    size: screenHeight * 0.189,
                                  ),
                                  Text(
                                    "Click here to add files",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenHeight * 0.018,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ))
                          : Container(
                              height: screenHeight * 0.25,
                              width: screenWidth * 0.58,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: imagePath != null
                                    ? FileImage(imagePath!)
                                    : null,
                              ),
                            ))
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, MainScreen.routeName,
                      arguments: imagePath);
                },
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF1B0950),
                    minimumSize: Size(screenWidth * 0.74, 49)),
                child: const Text(
                  'Register Car',
                  style: TextStyle(
                      fontFamily: 'Jura',
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;

    setState(() {
      imagePath = File(returnedImage.path);
    });
  }
}
