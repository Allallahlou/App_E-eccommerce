import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('en', ''); // Default to English

  Locale get currentLocale => _currentLocale;

  void toggleLanguage() {
    if (_currentLocale.languageCode == 'en') {
      _currentLocale = const Locale('ar', ''); // Switch to Arabic
    } else {
      _currentLocale = const Locale('en', ''); // Switch to English
    }
    notifyListeners();
  }
}
