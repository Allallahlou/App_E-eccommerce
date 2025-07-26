import 'dart:math';
import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Custom_Bottom_Nav extends StatefulWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const Custom_Bottom_Nav({
    Key? key,
    required this.currentIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  State<Custom_Bottom_Nav> createState() => _Custom_Bottom_NavState();
}

class _Custom_Bottom_NavState extends State<Custom_Bottom_Nav>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(); // تكرار لا نهائي
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final bool isEnglish = languageProvider.currentLocale.languageCode == 'en';

    return Stack(
      children: [
        // موجة متحركة في الأسفل
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                size: const Size(double.infinity, 70),
                painter: AnimatedWavePainter(_controller.value),
              );
            },
          ),
        ),
        // BottomNavigationBar فوق الموجة
        BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: widget.currentIndex,
          onTap: widget.onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black.withOpacity(0.6),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: isEnglish ? "Home" : "الرئيسية",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              label: isEnglish ? "Cart" : "عربة التسوق",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.category_sharp),
              label: isEnglish ? "Categories" : "التصنيفات",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: isEnglish ? "Account" : "حساب",
            ),
          ],
        ),
      ],
    );
  }
}

// 🎨 Painter للموجة المتحركة
class AnimatedWavePainter extends CustomPainter {
  final double animationValue;
  AnimatedWavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.grey.shade700;
    final Path path = Path();

    double waveHeight = 20;
    double waveLength = size.width / 1.5;
    double speed = animationValue * 2 * pi;

    path.moveTo(0, waveHeight);

    for (double x = 0; x <= size.width; x++) {
      double y = sin((x / waveLength * 2 * pi) + speed) * 10;
      path.lineTo(x, waveHeight + y);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant AnimatedWavePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
