import 'package:app_e_ecommerce/View/Drawer/Theme%20Mode/theme_mode.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/LoginScreen.dart';
import 'package:app_e_ecommerce/View/scren/scren.dart';
import 'package:app_e_ecommerce/provider/mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ModeProvider(),
    child: const MyApp()
    ),
    );
}
class MyApp extends StatefulWidget {

  const MyApp(
    {Key? key}
    ) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: Provider.of<ModeProvider>
      (context).lightModeEnable ? 
      ModeTheme.lightMode: ModeTheme.darkMode,
      debugShowCheckedModeBanner: false,
      title: 'Online Store Watches ',
      home: scren(
        onThemeChanged: (ThemeMode){}
        ),
    );
  }
}