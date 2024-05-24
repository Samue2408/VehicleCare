import 'package:flutter/material.dart';


AppBar appbar_general(double screenHeight, BuildContext context) {    
    return AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,          
          surfaceTintColor: Theme.of(context).colorScheme.onBackground,
          title: Text(
                'VehicleCare',
                style: TextStyle(
                    fontFamily: 'Bruno Ace',
                    fontSize: screenHeight * 0.0315,
                    color: Theme.of(context).colorScheme.secondary),
              ),);
  }