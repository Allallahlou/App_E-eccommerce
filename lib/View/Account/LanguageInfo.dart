import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LanguageInfoScreen extends StatelessWidget {
  const LanguageInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          languageProvider.currentLocale.languageCode == 'en'
              ? "Language Information"
              : "معلومات اللغة",
          style: GoogleFonts.adamina(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent.shade400,
              letterSpacing: .5,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.language, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            Text(
              languageProvider.currentLocale.languageCode == 'en'
                  ? 'Welcome to the Language Information Screen!'
                  : 'مرحبًا بك في شاشة معلومات اللغة!',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                languageProvider.toggleLanguage();
              },
              child: Text(
                languageProvider.currentLocale.languageCode == 'en'
                    ? 'Switch to Arabic'
                    : 'التبديل إلى الإنجليزية',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
