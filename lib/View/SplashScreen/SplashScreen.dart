// ignore_for_file: file_names, library_private_types_in_public_api
import 'package:app_e_ecommerce/View/Login%20Screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;
  final List<String> animations = [
    'Json/yyy.json',
    'Json/k.json',
    'Json/ddl.json'
  ];
  final List<String> messages = [
    "Welcome To Our App ",
    "Discover Our Best Watches ",
    "Quality And Style At Your Fingertips"
  ];

  @override
  void initState() {
    super.initState();
    _startAnimationSequence();
  }

  void _startAnimationSequence() {
    for (int i = 0; i < animations.length; i++) {
      Timer(Duration(seconds: (i + 1) * 4), () {
        if (mounted) {
          setState(() => _currentIndex = i);
        }
        if (i == animations.length - 1) {
          Timer(const Duration(seconds: 4), () {
            if (mounted) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            }
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: AnimationScreen(
          key: ValueKey<int>(_currentIndex),
          animationPath: animations[_currentIndex],
          message: messages[_currentIndex],
        ),
      ),
    );
  }
}

class AnimationScreen extends StatelessWidget {
  final String animationPath;
  final String message;

  const AnimationScreen(
      {Key? key, required this.animationPath, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade900, Colors.pink.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.pinkAccent.withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
          // ignore: deprecated_member_use
          border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(animationPath, width: 300, height: 300),
            const SizedBox(height: 20),
            Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black45,
                    blurRadius: 5,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
