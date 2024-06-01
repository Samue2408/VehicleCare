import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vehicle_care/Presentation/Screens/MainScreen.dart';
import 'package:vehicle_care/Presentation/Screens/RegisterScreen.dart';
import 'package:vehicle_care/Presentation/Screens/home_page.dart';
import 'package:vehicle_care/Core/Dominio/PreferenciaUsuario/UserPreferences.dart';
import 'package:vehicle_care/Presentation/Widgets/camposTexto.dart';
import 'package:vehicle_care/Presentation/Widgets/_showMyDialog.dart';

class Sign_In_ extends StatefulWidget {
  const Sign_In_({super.key});

  static const String routeName = "SignInScreen";

  @override
  State<Sign_In_> createState() => _Sign_In_State();
}

class _Sign_In_State extends State<Sign_In_> {
  bool _isObscurredtext = true; //variable para la funcion de ocultar contraseña

  final prefs = PreferenciaUsuario();

  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isEmpty = false;

  bool email_exist = false;

  @override
  Widget build(BuildContext context) {
    //variables
    double screenHeight = MediaQuery.of(context).size.height;
    List<dynamic> users = prefs.listUser();
    print(users);
    //
    return SafeArea(
      child: Scaffold(
        body: Container(
          //medidas
          width: double.infinity,
          height: screenHeight,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 150),
          //decoration
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Color(0xff050309),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Sign In",
                style: TextStyle(
                    fontFamily: 'Bruno Ace',
                    fontSize: 30,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
              Column(
                children: <Widget>[
                  camposTexto("User", Icons.account_circle_rounded,
                      TextInputType.none, userController),
                  camposTexto("User", Icons.lock, TextInputType.visiblePassword,
                      passwordController),
                ],
              ),
              //boton del login
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Color(0xFF1B0950)),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(317, 60))),
                child: const Text(
                  'Log In',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  if (userController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    for (var i = 0; i < users.length; i++) {
                      if (userController.text == users[i]['email'] &&
                          passwordController.text == users[i]['password']) {
                        Navigator.pushReplacementNamed(
                            context, MainScreen.routeName,
                            arguments: users[i]['id']);
                        return;
                      }
                    }

                    showMyDialog(context, 'Wrong credentials',
                        'Please carefully review the credentials you have entered');
                  } else {
                    setState(() {
                      isEmpty = true;
                    });
                  }
                },
              ),
              Column(
                //redigir a la pagina de sign up
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                            fontFamily: 'Jura',
                            fontSize: 12,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      TextButton(
                        child: Text(
                          "Sign up",
                          style: stylefont(15, Color(0xFF1B0950)),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, RegisterScreen.routeName);
                        },
                      ),
                    ],
                  ),
                  TextButton(
                    child: Text(
                      "¿Forget Password?",
                      style: stylefont(15, Color(0xFF1B0950)),
                    ),
                    onPressed: () {
                      /*Aqui va la accion para irse a la pagina de olvidar contraseña*/
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle stylefont(var sizee, color) {
    return TextStyle(
      fontFamily: 'Jura',
      fontSize: sizee,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }
}
