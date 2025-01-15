import 'package:flutter/material.dart';

Widget customButton({
  required BuildContext context,
  required String label,
  required VoidCallback onPressed,
  bool isSecondary = false,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: isSecondary ? Colors.white : Colors.pinkAccent,
        borderRadius: BorderRadius.circular(30),
        border: isSecondary
            ? Border.all(color: Colors.pinkAccent, width: 1.5)
            : null,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isSecondary ? Colors.pinkAccent : Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
