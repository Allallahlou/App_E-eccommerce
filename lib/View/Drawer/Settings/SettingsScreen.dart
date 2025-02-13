import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isEnglish = languageProvider.currentLocale.languageCode == 'en';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Center(
          child: Text(
            isEnglish ? " Settings" : "  إعدادات",
          ),
        ),
      ),
      body: Center(
        child: Text(
          isEnglish ? " Settings Page" : "صفحة الإعدادات",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
