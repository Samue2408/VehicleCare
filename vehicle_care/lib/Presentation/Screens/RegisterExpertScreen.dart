import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_care/Screens/FormKnowledge_Screen.dart';
import 'package:vehicle_care/Widgets/camposTexto.dart';

class RegisterExperts extends StatefulWidget {
  const RegisterExperts({super.key});

  static const String routeName = "registerExpert";

  @override
  State<RegisterExperts> createState() => _RegisterExpertsState();
}

class _RegisterExpertsState extends State<RegisterExperts> {
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
                  Text('Sign Up',
                      style: TextStyle(
                        fontFamily: 'Bruno Ace',
                        fontSize: screenHeight * 0.04,
                        color: Colors.white,
                      )),
                  Text('Experts',
                      style: TextStyle(
                        fontFamily: 'Bruno Ace',
                        fontSize: screenHeight * 0.04,
                        color: Colors.white,
                      )),
                ],
              ),
              Column(
                children: [
                  camposTexto(
                      'Work address', Icons.work_outline, TextInputType.name),
                  camposTexto(
                      'Speciality', Icons.email, TextInputType.emailAddress),
                  camposTexto('Years of experience', Icons.edit_calendar,
                      TextInputType.phone),
                ],
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, QuestionsPage.routeName);
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
                                print("hola2");
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
}
