import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:  Text(
           languageProvider.currentLocale.languageCode == 'en'
                                    ? " Settings"
                                    : "  إعدادات",
          ),
        backgroundColor: const Color(0xFF113953),
      ),
      body:  Center(
        child: Text(
           languageProvider.currentLocale.languageCode == 'en'
                                    ? " Settings Page"
                                    : "صفحة الإعدادات",
          style: const TextStyle(
            fontSize: 20
            ),
        ),
      ),
    );
  }
}
