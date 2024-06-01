import 'package:flutter/material.dart';


Future<void> showMyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('existing user', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('este usuario ya existe'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Try again', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}