import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vehicle_care/Presentation/Screens/MainScreen.dart';
import 'package:vehicle_care/Presentation/Screens/RegisterScreen.dart';

class Sign_In_ extends StatefulWidget {
  const Sign_In_({super.key});

  static const String routeName = "SignInScreen";

  @override
  State<Sign_In_> createState() => _Sign_In_State();
}

class _Sign_In_State extends State<Sign_In_> {
  bool _isObscurredtext = true; //variable para la funcion de ocultar contraseña

  @override
  Widget build(BuildContext context) {
    //variables
    double screenHeight = MediaQuery.of(context).size.height;
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  Container(
                    //user
                    //medids
                    margin:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    //decoration
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                          color: const Color(0xFF1B0950), width: 2.0),
                      color: Color(0xff050309),
                    ),
                    //context
                    child: const TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.account_circle_rounded,
                            color: Colors.white,
                            weight: 20,
                          ),
                          hintText: "User or Email",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.4),
                              fontFamily: "Jura",
                              fontWeight: FontWeight.w300),
                          border: InputBorder.none),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.none,
                    ),
                  ),
                  Container(
                    //pasword
                    //medids
                    margin:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    //decoration
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                          color: const Color(0xFF1B0950), width: 2.0),
                      color: Color(0xff050309),
                    ),
                    //context
                    child: TextField(
                      obscureText: _isObscurredtext,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                          weight: 20,
                        ),
                        hintText: "Password",
                        hintStyle: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.4),
                            fontFamily: "Jura",
                            fontWeight: FontWeight.w300),
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                            icon: Icon(
                              _isObscurredtext
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscurredtext = !_isObscurredtext;
                              });
                            }),
                      ),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
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
                  Navigator.pushReplacementNamed(context, MainScreen.routeName);
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
