import 'package:flutter/material.dart';

Container camposTexto(String hint, IconData icono, TextInputType tipo) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
    padding: const EdgeInsets.symmetric(horizontal: 5),
    width: 750,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: const Color(0xFF1B0950), width: 2.0),
        color: const Color(0xff050309)),
    child: TextField(
      obscureText: tipo == TextInputType.visiblePassword ? true : false,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icono,
            color: Colors.white,
            weight: 20,
          ),
          hintText: hint,
          hintStyle: const TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.4),
              fontFamily: 'Jura',
              fontWeight: FontWeight.w300),
          border: InputBorder.none),
      style: const TextStyle(
        color: Colors.white,
      ),
      keyboardType: tipo,
    ),
  );
}
