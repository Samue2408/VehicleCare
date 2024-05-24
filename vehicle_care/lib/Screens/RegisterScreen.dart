// ignore_for_file: unused_local_variable, sized_box_for_whitespace, file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_care/Screens/FormKnowledge_Screen.dart';
import 'package:vehicle_care/Screens/RegisterExpertScreen.dart';
import 'package:vehicle_care/Screens/Sign_in_Screen.dart';
import 'package:vehicle_care/Widgets/camposTexto.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String routeName = "register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool? isChecked = false;
  final List<String> _items = ['User', 'Expert'];
  String? _selectedItem;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
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
              Text('Sign Up',
                  style: TextStyle(
                    fontFamily: 'Bruno Ace',
                    fontSize: screenHeight * 0.04,
                    color: Colors.white,
                  )),
              Column(
                children: [
                  camposTexto('Name', Icons.person, TextInputType.name),
                  camposTexto(
                      'User or Email', Icons.email, TextInputType.emailAddress),
                  camposTexto(
                      'Cellphone', Icons.phone_iphone, TextInputType.phone),
                  camposTexto(
                      'Password', Icons.lock, TextInputType.visiblePassword),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        alignment: Alignment.centerLeft,
                        width: 750,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                                color: const Color(0xFF1B0950), width: 2.0),
                            color: const Color(0xff050309)),
                        child: const Icon(
                          Icons.account_circle,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                          left: 45,
                          right: 52,
                          child: menuDesplegable('Type User'))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: const Color(0xFF1B0950),
                      ),
                      SizedBox(
                        height: screenHeight * 0.09,
                      ),
                      RichText(
                          text: TextSpan(
                              style: const TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.5),
                                  fontFamily: 'Jura',
                                  fontWeight: FontWeight.w300),
                              children: [
                            const TextSpan(text: "I read and agree to "),
                            TextSpan(
                                text: "Terms & Conditions",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print("hola");
                                  })
                          ])),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context,
                          _selectedItem == 'User'
                              ? QuestionsPage.routeName
                              : RegisterExperts.routeName);
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF1B0950),
                        minimumSize: Size(screenWidth * 0.74, 49)),
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                          fontFamily: 'Jura',
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.5),
                              fontFamily: 'Jura',
                              fontWeight: FontWeight.w300),
                          children: [
                        const TextSpan(text: "¿Already have an account? "),
                        TextSpan(
                            text: "Sign In",
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF1B0950),
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                    context, Sign_In_.routeName);
                              })
                      ])),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }

  Container menuDesplegable(String hint) {
    return Container(
        width: 690,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _selectedItem,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            hint: const Text(
              "Type User",
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.4),
                fontFamily: 'Jura',
                fontWeight: FontWeight.w500,
              ),
            ),
            style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            dropdownColor: const Color.fromARGB(226, 27, 9, 80),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            padding: const EdgeInsets.only(left: 33),
            items: _items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? selectedItem) {
              setState(() {
                _selectedItem = selectedItem;
              });
            },
          ),
        ));
  }
}
