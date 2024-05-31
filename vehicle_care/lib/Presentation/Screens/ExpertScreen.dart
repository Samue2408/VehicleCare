import 'package:flutter/material.dart';
import 'package:vehicle_care/Presentation/Widgets/appbar_general.dart';
import 'package:vehicle_care/Presentation/Widgets/menuDrawer.dart';
import 'package:vehicle_care/Presentation/Widgets/navBar.dart';
import 'package:vehicle_care/Presentation/Screens/ExpertProfileScreen.dart';

class ExpertScreen extends StatefulWidget {
  const ExpertScreen({super.key});

  static const String routeName = "ExpertScreen";

  @override
  State<ExpertScreen> createState() => _ExpertScreenState();
}

class _ExpertScreenState extends State<ExpertScreen> {
  @override
  Widget build(BuildContext context) {
    //medidas
    ColorScheme colorTema = Theme.of(context).colorScheme;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<Icon> icon = [];

    return SafeArea(
      child: Scaffold(
        appBar: appbar_general(screenHeight, context),
        drawer:
            MenuDrawer(screenHeight: screenHeight, screenWidth: screenWidth),
        body: Container(
          //medidas
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.079, vertical: screenHeight * 0.0),
          //
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  colorTema.background,
                  colorTema.onBackground,
                ]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.021),
                child: Text(
                  "Filters",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: screenHeight * 0.019,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Filterss(screenHeight, screenWidth, "All", Colors.black,
                      Colors.white, 0.06),
                  SizedBox(
                    width: screenWidth * 0.023,
                  ),
                  Filterss(screenHeight, screenWidth, "Specialty",
                      Color(0xffB8B8B8), Colors.white, 0.016),
                  SizedBox(
                    width: screenWidth * 0.023,
                  ),
                  Filterss(screenHeight, screenWidth, "Distance",
                      Color(0xffB8B8B8), Colors.white, 0.016),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.031),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.037,
                ),
                width: screenWidth * 0.90,
                height: 618,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Color(0xffB8B8B8)),
                  borderRadius: BorderRadius.circular(12.5),
                  color: Color(
                      0xffD9D9D9), //color general del espacio de los perfiles
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: screenHeight * 0.016),
                      child: Text(
                        "Expert Profiles",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: screenHeight * 0.019,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: screenHeight * 0.005),
                      child: Text(
                        "Personnel dedicated to vehicle maintenance",
                        style: TextStyle(
                            color: Color(0xff756D6D),
                            fontSize: screenHeight * 0.015,
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                    Container(
                      height: screenHeight * 0.58,
                      child: SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.only(bottom: screenHeight * 0.018),
                          height: screenHeight * 0.66,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ExpertProfile()));
                                },
                                child: Column(
                                  children: [
                                    Card_Mec(
                                      screenHeight,
                                      screenWidth,
                                      "Alfredo Comas P",
                                      "Calle 55 # 96 - 75 / Barranquilla-Atlántico",
                                      icon = [
                                        Icon(Icons.star,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                        Icon(Icons.star,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                        Icon(Icons.star,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                        Icon(Icons.star_half,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                      ],
                                    ),
                                    Card_Mec(
                                      screenHeight,
                                      screenWidth,
                                      "Mauricio Molina P.",
                                      "Calle 55 # 96 - 85 / Barranquilla-Atlántico",
                                      icon = [
                                        Icon(Icons.star,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                        Icon(Icons.star,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                        Icon(Icons.star,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                        Icon(Icons.star_half,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                      ],
                                    ),
                                    Card_Mec(
                                      screenHeight,
                                      screenWidth,
                                      "Adriana Gomez K.",
                                      "Calle 55 # 96 - 75 / Barranquilla-Atlántico",
                                      icon = [
                                        Icon(Icons.star,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                        Icon(Icons.star,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                        Icon(Icons.star,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                        Icon(Icons.star_half,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                      ],
                                    ),
                                    Card_Mec(
                                      screenHeight,
                                      screenWidth,
                                      "Diego Martinez",
                                      "Calle 55 # 96 - 88 / Barranquilla-Atlántico",
                                      icon = [
                                        Icon(Icons.star,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                        Icon(Icons.star,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                        Icon(Icons.star,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                        Icon(Icons.star_half,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                      ],
                                    ),
                                    Card_Mec(
                                      screenHeight,
                                      screenWidth,
                                      "Pablo Noriega C",
                                      "Calle 55 # 36 - 55 / Barranquilla-Atlántico",
                                      icon = [
                                        Icon(Icons.star,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                        Icon(Icons.star,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                        Icon(Icons.star,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                        Icon(Icons.star_half,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                      ],
                                    ),
                                    Card_Mec(
                                      screenHeight,
                                      screenWidth,
                                      "Sergio Cantillo D.",
                                      "Calle 55 # 98 - 77 / Barranquilla-Atlántico",
                                      icon = [
                                        Icon(Icons.star,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                        Icon(Icons.star,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                        Icon(Icons.star,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                        Icon(Icons.star_half,
                                            color: Color(0xff1B0950),
                                            weight: screenHeight * 0.016),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:
            Navbar(screenHeight, screenWidth, context, perfil: true),
      ),
    );
  }

  Container Card_Mec(double screenHeight, double screenWidth, String NameUser,
      String Direc, List<Icon> icons) {
    return Container(
      //container de la tarjeta de cada mecanico
      margin: EdgeInsets.only(top: screenHeight * 0.019),
      width: screenWidth * 0.82, height: screenHeight * 0.081,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        //color de la tarjeta de cada mecanico
        color: Color(0xffB8B8B8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            //container de la foto del mecanico
            width: screenWidth * 0.12, height: screenHeight * 0.047,
            margin: EdgeInsets.only(
                top: screenHeight * 0.017,
                bottom: screenHeight * 0.018,
                left: screenWidth * 0.026,
                right: screenWidth * 0.026),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xffF5EEEE),
            ),
            child: Icon(
              Icons.account_circle_rounded,
              color: Color(0xff1B0950),
              weight: screenHeight * 0.021,
            ),
          ),
          Container(
            //container de la informacion principal del mecanico
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: screenHeight * 0.017,
                        bottom: screenHeight * 0.00018),
                    child: Text(NameUser,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: screenHeight * 0.013,
                            fontWeight: FontWeight.bold))),
                Container(
                    child: Text(Direc,
                        style: TextStyle(
                            color: Color(0xff756D6D),
                            fontSize: screenHeight * 0.010,
                            fontWeight: FontWeight.w100))),
                Row(
                  children: icons,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container Filterss(double screenHeight, double screenWidth, String texto,
      Color colorBac, Color colorT, double x) {
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.021),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.003, horizontal: screenWidth * x),
      width: screenWidth * 0.19,
      height: screenHeight * 0.027,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.5),
        color: colorBac,
      ),
      child: Text(
        texto,
        style: TextStyle(
            color: colorT,
            fontSize: screenHeight * 0.014,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
