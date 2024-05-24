import 'package:flutter/material.dart';
import 'package:vehicle_care/Presentation/Screens/RegisterScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  static const String routeName = "IndexScreen";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

bool _isTransforming = true;

class _MyHomePageState extends State<MyHomePage> {
  double translateX = 0.0;
  double translateY = 0.0;
  double myWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 120),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/carro_fondo.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(left: screenWidth * 0.07),
                  child: const Column(
                    children: [
                      Text(
                        'TAKE CARE OF YOUR CAR. SECURE YOUR TRIP',
                        style: TextStyle(
                            fontFamily: 'Bruno Ace',
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      Text(
                        'Your car, our priority! Keep your vehicle safe with VehicleCar.',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w100),
                      ),
                    ],
                  )),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xff050309)),
                  width: MediaQuery.of(context).size.width * 0.79,
                  height: MediaQuery.of(context).size.height * 0.063,
                  padding: EdgeInsets.only(left: 7),
                  child: GestureDetector(
                      onHorizontalDragUpdate: (event) async {
                        if (event.primaryDelta! > 10) {
                          _TransformX();
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getStarted(),
                          myWidth == 0.0
                              ? const Expanded(
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color:
                                              Color.fromRGBO(27, 9, 80, 0.25),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Color.fromRGBO(27, 9, 80, 0.5),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Color.fromRGBO(27, 9, 80, 0.8),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Color.fromRGBO(27, 9, 80, 1),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getStarted() => Transform.translate(
      offset: Offset(0, 0),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 270),
          onEnd: () => {
                setState(() {
                  _stopTransformX();
                  Navigator.pushReplacementNamed(
                      context, RegisterScreen.routeName);
                })
              },
          curve: Curves.linear,
          width: myWidth == 0 ? 161 : myWidth,
          height: 47,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 2, color: const Color(0XFF1B0950))),
          child: myWidth > 0.0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Success',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Get started',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )));
  _TransformX() async {
    int canLoop = -1;
    while (canLoop == -1 && _isTransforming) {
      await Future.delayed(const Duration(milliseconds: 1), () {
        setState(() {
          if (translateX + 1 < MediaQuery.of(context).size.width * 0.15) {
            translateX += 1;
            myWidth = MediaQuery.of(context).size.width * 0.76;
            return;
          } else {
            setState(() {
              canLoop = 1;
            });
          }
        });
      });
    }
  }

  _stopTransformX() {
    setState(() {
      _isTransforming = false;
    });
  }
}
