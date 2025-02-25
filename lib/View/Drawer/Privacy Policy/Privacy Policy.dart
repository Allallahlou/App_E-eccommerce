// ignore_for_file: file_names

import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          languageProvider.currentLocale.languageCode == 'en'
              ? " Privacy and Security"
              : "  الخصوصية والأمان",
          style: GoogleFonts.adamina(
            textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent.shade400,
                letterSpacing: .5),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              languageProvider.currentLocale.languageCode == 'en'
                  ? " privacy policy"
                  : "سياسة الخصوصية",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(languageProvider.currentLocale.languageCode == 'en'
                ? "We respect your privacy and are committed to protecting your data."
                    "The information is used only to improve user experience."
                : "نحن نحترم خصوصيتك ونلتزم بحماية بياناتك."
                    "يتم استخدام المعلومات فقط لتحسين تجربة المستخدم."),
          ],
        ),
      ),
    );
  }
}
