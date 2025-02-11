import 'package:flutter/material.dart';

Widget socialButton({
  required String imagePath,
  required VoidCallback onPressed,
  Color borderColor = Colors.transparent,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
            color: borderColor,
            width: borderColor == Colors.transparent ? 0 : 1.5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipOval(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  );
}
