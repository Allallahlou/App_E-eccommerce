import 'package:app_e_ecommerce/View/les_elements/Home/Home_scren.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:device_preview/device_preview.dart';

import 'View/Drawer/Notification/Notification.dart';
import 'View/les_elements/Favorite/favorite_screen.dart';
import 'View/Drawer/Notification/notification_provider/notification_provider.dart';
import 'provider/mode_provider.dart';
import 'View/language/language_provider.dart';
import 'View/CartScreen/LoginPage.dart';
import 'View/Login Screen/SignUpScreen.dart';
import 'View/Drawer/Theme Mode/theme_mode.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ModeProvider()),
          ChangeNotifierProvider(create: (_) => LanguageProvider()),
          ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final modeProvider = Provider.of<ModeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    bool isEnglish = languageProvider.currentLocale.languageCode == 'en';

    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: languageProvider.currentLocale,
      builder: DevicePreview.appBuilder,
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: isEnglish ? "Watch Shop" : "متجر الساعات",
      theme: modeProvider.lightModeEnable
          ? ModeTheme.lightMode
          : ModeTheme.darkMode,
      debugShowCheckedModeBanner: false,
      home: const Home_Screen(),
      routes: {
        "signup": (context) => const SignUpScreen(),
        "login": (context) => const Login_PageScreen(),
        "homepage": (context) => const Home_Screen(),
        '/notifications': (context) => const NotificationScreen(),
        '/favorites': (context) => FavoriteScreen(
              favoriteItems: const [],
              onRemoveItem: (item) {},
            ),
      },
    );
  }
}
