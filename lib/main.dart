import 'package:app_e_ecommerce/View/Category/CategoryScreen.dart';
import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:app_e_ecommerce/View/CartScreen/LoginPage.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'provider/mode_provider.dart';
import 'View/Drawer/Theme%20Mode/theme_mode.dart';
import 'View/les_elements/Home/Home_scren.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ModeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modeProvider = Provider.of<ModeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    bool isEnglish = languageProvider.currentLocale.languageCode == 'en';

    return MaterialApp(
      theme: modeProvider.lightModeEnable
          ? ModeTheme.lightMode
          : ModeTheme.darkMode,
      debugShowCheckedModeBanner: false,
      title: isEnglish ? " Watch Shop" : " متجر الساعات ",
      locale: languageProvider.currentLocale,
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('ar', ''), // Arabic
      ],
      localizationsDelegates: const [
        ...GlobalMaterialLocalizations.delegates,
      ],
      home: CategoryScreen(),
      routes: {
        "signup": (context) => const SignUpScreen(),
        "login": (context) => const Login_PageScreen(),
        "homepage": (context) => const Home_Screen()
      },
    );
  }
}
