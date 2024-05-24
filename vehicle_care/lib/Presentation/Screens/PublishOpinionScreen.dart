import 'package:flutter/material.dart';
import 'package:vehicle_care/Presentation/Screens/ExpertProfileScreen.dart';
import 'package:vehicle_care/Presentation/Widgets/menuDrawer.dart';

class PublishOpinionPage extends StatefulWidget {
  const PublishOpinionPage({super.key});

  static const String routeName = "PublishOpinionPage";

  @override
  State<PublishOpinionPage> createState() => _PublishOpinionPageState();
}

class _PublishOpinionPageState extends State<PublishOpinionPage> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ColorScheme colorTema = Theme.of(context).colorScheme;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffF0F0F0),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, ExpertProfile.routeName);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff1B0950),
              size: screenHeight * 0.020,
            ),
          ),
          title: Text(
            "Expert Profile",
            style: TextStyle(
                fontSize: screenHeight * 0.019,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        endDrawer:
            MenuDrawer(screenHeight: screenHeight, screenWidth: screenWidth),
        body: SingleChildScrollView(
          child: Container(
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
            child: Center(
              child: Flexible(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: screenHeight * 0.030,
                          bottom: screenHeight * 0.017),
                      child: Icon(
                        Icons.account_circle_rounded,
                        color: Color(0xff1B0950),
                        size: screenHeight * 0.11,
                      ),
                    ),
                    Text(
                      "Alfredo Comas P.",
                      style: TextStyle(
                          fontSize: screenHeight * 0.024,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: screenWidth * 0.22, right: screenWidth * 0.24),
                      child: Text(
                        "Technician specialist in the maintenance of diesel engines.",
                        style: TextStyle(
                            fontSize: screenHeight * 0.013,
                            color: Color(0xff6A5E5E),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      "Calle 46 # 26 - 45",
                      style: TextStyle(
                          fontSize: screenHeight * 0.016,
                          color: Color(0xffB8B8B8),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Overall Rating",
                      style: TextStyle(
                          fontSize: screenHeight * 0.016,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "4.6",
                      style: TextStyle(
                          fontSize: screenHeight * 0.051,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star,
                            color: Color(0xff1B0950),
                            weight: screenHeight * 0.016),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: screenWidth * 0.068),
                          child: Text(
                            "Reviews",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: screenHeight * 0.019,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: screenWidth * 0.068),
                          child: Row(
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(top: screenHeight * 0.021),
                                alignment: Alignment.center,
                                //padding: EdgeInsets.symmetric(vertical: screenHeight*0.003, horizontal: screenWidth*),
                                width: screenWidth * 0.19,
                                height: screenHeight * 0.027,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.5),
                                  color: colorTema.primary,
                                ),
                                child: Text(
                                  "ALL",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.014,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.023,
                              ),
                              Filterss(screenHeight, screenWidth, "5",
                                  Color(0xffB8B8B8), Colors.white),
                              SizedBox(
                                width: screenWidth * 0.023,
                              ),
                              Filterss(screenHeight, screenWidth, "4",
                                  Color(0xffB8B8B8), Colors.white),
                              SizedBox(
                                width: screenWidth * 0.023,
                              ),
                              Filterss(screenHeight, screenWidth, "3",
                                  Color(0xffB8B8B8), Colors.white),
                              SizedBox(
                                width: screenWidth * 0.023,
                              ),
                              Filterss(screenHeight, screenWidth, "2",
                                  Color(0xffB8B8B8), Colors.white),
                              SizedBox(
                                width: screenWidth * 0.023,
                              ),
                              Filterss(screenHeight, screenWidth, "1",
                                  Color(0xffB8B8B8), Colors.white),
                              SizedBox(
                                width: screenWidth * 0.023,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: screenWidth * 0.051,
                              top: screenHeight * 0.031),
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.037),
                          width: screenWidth * 0.90,
                          height: screenHeight * 0.32,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.0, color: Color(0xffB8B8B8)),
                            borderRadius: BorderRadius.circular(12.5),
                            color: Color(
                                0xffD9D9D9), //color general del espacio de los perfiles
                          ),
                          child: Flexible(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: screenHeight * 0.014),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "@nombre_usuario",
                                        style: TextStyle(
                                          fontSize: screenHeight * 0.014,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "24/02/2023",
                                        style: TextStyle(
                                          fontSize: screenHeight * 0.014,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.015,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //estrellas en donde se van a clasificar al experto
                                    Icon(Icons.star_outline,
                                        color: Color(0xff1F1E16),
                                        weight: screenHeight * 0.016),
                                    Icon(Icons.star_outline,
                                        color: Color(0xff1F1E16),
                                        weight: screenHeight * 0.016),
                                    Icon(Icons.star_outline,
                                        color: Color(0xff1F1E16),
                                        weight: screenHeight * 0.016),
                                    Icon(Icons.star_outline,
                                        color: Color(0xff1F1E16),
                                        weight: screenHeight * 0.016),
                                    Icon(Icons.star_outline,
                                        color: Color(0xff1F1E16),
                                        weight: screenHeight * 0.016),
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight * 0.015,
                                ),
                                Text(
                                    "The opinions that are made are public and contain information from your account"),
                                SizedBox(
                                  height: screenHeight * 0.015,
                                ),
                                Container(
                                  height: screenHeight * 0.144,
                                  width: screenWidth * 0.82,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 136, 135, 135),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: TextField(
                                      controller: _textEditingController,
                                      onChanged: (text) {
                                        //widget.onTextChanged(text);
                                      },
                                      maxLines:
                                          null, // Allow multiple lines of text
                                      maxLength: 5000,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Describe your experience.",
                                        hintStyle: TextStyle(
                                            fontSize: screenHeight * 0.014,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 241, 236, 236)),
                                        counterText:
                                            '', // Hide the default character count
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        width: screenWidth * 0.34,
                        height: screenHeight * 0.036,
                        margin: EdgeInsets.only(
                            top: screenHeight * 0.020,
                            left: screenWidth * 0.33,
                            right: screenWidth * 0.33),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.0, color: const Color(0xffB8B8B8)),
                          borderRadius: BorderRadius.circular(11),
                          color: const Color(
                              0xffD9D9D9), //color general del espacio de los perfiles
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff000000),
                              Color(0xff1B0950),
                            ],
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Publicar",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * 0.018),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container Card_Comentarios(double screenHeight, double screenWidth,
      String NameUser, String Date, List<Icon> icons, String Coments) {
    return Container(
      //container de la tarjeta de cada mecanico
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
      margin: EdgeInsets.only(top: screenHeight * 0.019),
      width: screenWidth * 0.82, height: screenHeight * 0.141,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        //color de la tarjeta de cada mecanico
        color: Color(0xffB8B8B8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                //container de la foto del mecanico
                width: screenWidth * 0.12, height: screenHeight * 0.047,
                margin: EdgeInsets.only(
                    top: screenHeight * 0.017,
                    bottom: screenHeight * 0.018,
                    /*left: screenWidth*0.026*/ right: screenWidth * 0.026),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xffF5EEEE),
                ),
                child: Icon(
                  Icons.account_circle_rounded,
                  color: Color(0xff1B0950),
                  size: screenHeight * 0.021,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          top: screenHeight * 0.010,
                          bottom: screenHeight * 0.00018),
                      child: Text(NameUser,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: screenHeight * 0.013,
                              fontWeight: FontWeight.bold))),
                  Text(Date,
                      style: TextStyle(
                          color: Color(0xff756D6D),
                          fontSize: screenHeight * 0.010,
                          fontWeight: FontWeight.w100)),
                  Row(
                    children: icons,
                  ),
                ],
              ),
            ],
          ),
          Text(
              //comentarios
              Coments,
              style: TextStyle(
                  color: Color(0xff756D6D),
                  fontSize: screenHeight * 0.014,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Container Filterss(double screenHeight, double screenWidth, String texto,
      Color colorCont, Color colorT) {
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.021),
      alignment: Alignment.center,
      //padding: EdgeInsets.symmetric(vertical: screenHeight*0.003, horizontal: screenWidth*x),
      width: screenWidth * 0.096, height: screenHeight * 0.026,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.5),
        color: colorCont,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            texto,
            style: TextStyle(
                color: colorT,
                fontSize: screenHeight * 0.018,
                fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.star,
            color: Color(0xffFFFFFF),
            size: screenHeight * 0.014,
          ),
        ],
      ),
    );
  }
}
