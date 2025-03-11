import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isSecondary;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isSecondary = false, required Color color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: isSecondary ? Colors.orange : Colors.pinkAccent,
          borderRadius: BorderRadius.circular(30),
          border: isSecondary
              ? Border.all(
                  color: Colors.orange,
                  width: 1.5,
                )
              : null,
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 6.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSecondary ? Colors.white : Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
