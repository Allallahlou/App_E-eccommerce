import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login_PageScreen extends StatelessWidget {
  const Login_PageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(
          child:  Text(

            "Login",
             style: GoogleFonts.adamina(

               textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent.shade400,
                letterSpacing:.5
                ),
                ),
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
