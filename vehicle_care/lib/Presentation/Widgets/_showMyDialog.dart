import 'package:flutter/material.dart';


Future<void> showMyDialog(context, String tp, String ts) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(tp, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(ts),
            ],
          ),
        ),
        elevation: 30.0,
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