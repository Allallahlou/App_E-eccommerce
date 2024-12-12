import 'package:flutter/material.dart';

class Login_PageScreen extends StatelessWidget {
  const Login_PageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Login"
            ),
            ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // أضف المنطق للتوجه إلى الصفحة الرئيسية أو شاشة أخرى
          },
          child: const Text(
            "Login"
            ),
        ),
      ),
    );
  }
}
