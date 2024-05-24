import 'package:flutter/material.dart';
import 'package:vehicle_care/Presentation/Widgets/appbar_general.dart';
import 'package:vehicle_care/Presentation/Widgets/menuDrawer.dart';
import 'package:vehicle_care/Presentation/Widgets/navBar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const String routeName = "SearchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    ColorScheme colorTema = Theme.of(context).colorScheme;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: appbar_general(screenHeight, context),
        drawer:
            MenuDrawer(screenHeight: screenHeight, screenWidth: screenWidth),
        body: Container(
          //medidas
          width: double.infinity,
          height: screenHeight,
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.079, vertical: screenHeight * 0.03),
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
                child: SearchAnchor(builder:
                    (BuildContext context, SearchController controller) {
                  return SearchBar(
                    controller: controller,
                    hintText: "Search",
                    hintStyle: MaterialStatePropertyAll(
                      TextStyle(
                        color: Color(0xff787878),
                        fontSize: screenWidth * 0.038,
                      ),
                    ),
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xffD9D9D9)),
                    padding: MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.038)),
                    onTap: () {
                      //controller.openView();
                    },
                    onChanged: (_) {
                      //controller.openView();
                    },
                    leading: Icon(Icons.search,
                        color: Color(0xff787878), size: screenWidth * 0.060),
                    trailing: <Widget>[
                      Tooltip(
                        message: 'Change brightness mode',
                      )
                    ],
                  );
                }, suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(1, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        setState(() {
                          controller.closeView(item);
                        });
                      },
                    );
                  });
                }),
              ),
              SizedBox(
                height: screenHeight * 0.030,
              ),
              Text(
                "POSSIBLE DIAGNOSES AND SOLUTIONS",
                style: TextStyle(
                    color: Color(0xff787878), fontSize: screenWidth * 0.035),
              ),
              Divider(
                color: Color(0xffB8B8B8),
                height: 2.0,
              ),
              Expanded(
                child: ListView(
                  children: [
                    HelpCards(screenHeight, screenWidth, colorTema),
                    HelpCards(screenHeight, screenWidth, colorTema),
                    HelpCards(screenHeight, screenWidth, colorTema),
                    HelpCards(screenHeight, screenWidth, colorTema),
                    HelpCards(screenHeight, screenWidth, colorTema),
                    HelpCards(screenHeight, screenWidth, colorTema),
                    HelpCards(screenHeight, screenWidth, colorTema),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.09,
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:
            Navbar(screenHeight, screenWidth, context, busqueda: true),
      ),
    );
  }

  Container HelpCards(
      double screenHeight, double screenWidth, ColorScheme color) {
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.020),
      padding: EdgeInsets.all(screenWidth * 0.032),
      width: screenWidth * 0.84,
      height: screenHeight * 0.18,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Color(0xffB8B8B8),
        ),
        borderRadius: BorderRadius.all(Radius.circular(12.5)),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: screenHeight * 0.0096),
            alignment: Alignment.topLeft,
            child: Text(
              " Ignition system problems",
              style: TextStyle(
                color: color.secondary,
                fontSize: screenWidth * 0.028,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: Text(
              "One of the most common is problems with the ignition system. If your vehicle has faults in the ignition system, you will have to check the ignition coil; if it does not work normally, you will notice that it becomes increasingly difficult to start the car.",
              style: TextStyle(
                color: Color(0xff787878),
                fontSize: screenHeight * 0.0128,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: screenHeight * 0.0008, left: screenWidth * 0.565),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xff1B0950)),
                minimumSize: MaterialStateProperty.all(
                    Size(screenWidth * 0.05, screenHeight * 0.030)),
              ),
              onPressed: () {},
              child: Text(
                maxLines: 1,
                "Show More",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.018,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
