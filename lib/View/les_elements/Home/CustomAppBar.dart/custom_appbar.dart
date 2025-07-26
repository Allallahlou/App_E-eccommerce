import 'dart:math';
import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 30);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(); // تكرار الحركة
  }

  @override
  void dispose() {
    _controller.dispose(); // تنظيف
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final bool isEnglish = languageProvider.currentLocale.languageCode == 'en';

    return Stack(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: AnimatedWavePainter(_controller.value),
              size: const Size(double.infinity, kToolbarHeight + 30),
            );
          },
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            isEnglish ? "Watch Shop" : "متجر الساعات",
            style: GoogleFonts.adamina(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: .5,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notification_add, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, '/notifications');
              },
            ),
          ],
        ),
      ],
    );
  }
}

// 🎨 Painter بالموجة المتحركة
class AnimatedWavePainter extends CustomPainter {
  final double animationValue;
  AnimatedWavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.grey.shade500;
    final Path path = Path();

    double waveHeight = 20;
    double waveLength = size.width / 1.5;
    double speed = animationValue * 2 * pi;

    path.moveTo(0, size.height - waveHeight);

    for (double x = 0; x <= size.width; x++) {
      double y = sin((x / waveLength * 2 * pi) + speed) * 10;
      path.lineTo(x, size.height - waveHeight + y);
    }

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant AnimatedWavePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
