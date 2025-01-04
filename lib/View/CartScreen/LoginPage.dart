import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Login_PageScreen extends StatelessWidget {

   Login_PageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:  Center(
          child:  Text(

            languageProvider.currentLocale.languageCode == 'en'
                                    ? " Login"
                                    : " تسجيل الدخول",
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
          child:Text(
            languageProvider.currentLocale.languageCode == 'en'
                                    ? " Login"
                                    : " تسجيل الدخول"),
        ),
      ),
    );
  }
}
