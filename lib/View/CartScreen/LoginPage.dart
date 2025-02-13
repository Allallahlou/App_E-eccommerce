import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Login_PageScreen extends StatelessWidget {
  const Login_PageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isEnglish = languageProvider.currentLocale.languageCode == 'en';

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            isEnglish ? " Login" : " تسجيل الدخول",
            style: GoogleFonts.adamina(
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent.shade400,
                  letterSpacing: .5),
            ),
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // أضف المنطق للتوجه إلى الصفحة الرئيسية أو شاشة أخرى
          },
          child: Text(isEnglish ? " Login" : " تسجيل الدخول"),
        ),
      ),
    );
  }
}
