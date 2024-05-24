import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_care/Screens/Sign_in_Screen.dart';
import 'package:vehicle_care/theme/theme_provider.dart';

class MenuDrawer extends StatefulWidget {
  MenuDrawer(
      {super.key, required this.screenHeight, required this.screenWidth});

  final double screenWidth;
  final double screenHeight;
  final MaterialStateProperty<Color?> trackColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Color.fromARGB(255, 27, 9, 80);
      }
      return null;
    },
  );

  final MaterialStateProperty<Color?> overlayColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Color.fromARGB(178, 27, 9, 80);
      }
      if (states.contains(MaterialState.disabled)) {
        return Colors.grey.shade400;
      }
      return null;
    },
  );

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(
          Icons.check,
          color: Colors.white,
        );
      }
      return const Icon(Icons.close);
    },
  );

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

bool colorsecundario = false;

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: widget.screenWidth * 0.6,
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(
                    "images/fotoperfil.webp",
                    height: widget.screenWidth * 0.128,
                    width: widget.screenWidth * 0.128,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Joaquín",
                      style: TextStyle(
                          fontFamily: 'Bruno Ace',
                          fontSize: widget.screenWidth * 0.042,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    Text(
                      "joaquincantilloc@gmail.com",
                      style: TextStyle(
                          color: Color(0xffB8B8B8),
                          fontSize: widget.screenWidth * 0.023,
                          fontWeight: FontWeight.w200),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: widget.screenHeight * 0.17,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "experts",
                        style: TextStyle(
                          color: Color(0xffB8B8B8),
                          fontSize: 18,
                        ),
                      ),
                      Icon(Icons.arrow_forward, color: Color(0xffB8B8B8))
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "dark mode",
                        style: TextStyle(
                          color: Color(0xffB8B8B8),
                          fontSize: 18,
                        ),
                      ),
                      Switch(
                          value: colorsecundario,
                          trackColor: widget.trackColor,
                          overlayColor: widget.overlayColor,
                          thumbColor: const MaterialStatePropertyAll<Color>(
                              Color.fromARGB(199, 27, 9, 80)),
                          trackOutlineColor:
                              const MaterialStatePropertyAll<Color>(
                                  Color(0xff1B0950)),
                          thumbIcon: widget.thumbIcon,
                          activeColor: const Color.fromARGB(193, 27, 9, 80),
                          onChanged: (value) {
                            setState(() {
                              Provider.of<ThemeProvider>(context, listen: false)
                                  .toggleTheme();
                              colorsecundario = !colorsecundario;
                            });
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Container(
            height: widget.screenHeight * 0.4,
            margin: EdgeInsets.symmetric(vertical: widget.screenHeight * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Terms & Conditions",
                      style: const TextStyle(
                          color: Color(0xffB8B8B8),
                          fontWeight: FontWeight.w600),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.output_outlined,
                      color: Color(0xffB8B8B8),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Sign_In_.routeName);
                        },
                        child: const Text(
                          "Sign out",
                          style: TextStyle(color: Color(0xffB8B8B8)),
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
