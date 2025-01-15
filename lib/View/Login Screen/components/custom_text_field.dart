import 'package:flutter/material.dart';

Widget customTextField({
  required String hintText,
  required IconData icon,
  bool obscureText = false,
}) {
  return TextField(
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: Icon(icon, color: Colors.pinkAccent),
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
