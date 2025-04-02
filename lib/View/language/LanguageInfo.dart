// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:app_e_ecommerce/View/language/language_provider.dart';

class LanguageInfoScreen extends StatelessWidget {
  const LanguageInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<LanguageProvider>(
          builder: (context, languageProvider, child) {
            bool isEnglish =
                languageProvider.currentLocale.languageCode == 'en';
            return Text(
              isEnglish ? "Language Information" : "معلومات اللغة",
              style: GoogleFonts.adamina(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent.shade400,
                  letterSpacing: .5,
                ),
              ),
            );
          },
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "images/rt.png"), // تأكد من وضع الصورة في المجلد الصحيح
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Consumer<LanguageProvider>(
            builder: (context, languageProvider, child) {
              bool isEnglish =
                  languageProvider.currentLocale.languageCode == 'en';
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.language, size: 100, color: Colors.blue),
                  const SizedBox(height: 20),
                  Text(
                    isEnglish
                        ? 'Welcome to the Language Information Screen!'
                        : 'مرحبًا بك في شاشة معلومات اللغة!',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: languageProvider.toggleLanguage,
                    child: Text(
                      isEnglish ? 'Switch to Arabic' : 'التبديل إلى الإنجليزية',
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
