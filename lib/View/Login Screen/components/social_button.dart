import 'package:flutter/material.dart';

Widget socialButton({
  required String imagePath,
  required VoidCallback onPressed,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(imagePath),
      ),
    ),
  );
}
