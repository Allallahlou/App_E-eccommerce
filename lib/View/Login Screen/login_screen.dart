import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/components/custom_button.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    List<Color> Cars = [
      const Color.fromARGB(255, 139, 149, 149),
      const Color.fromARGB(255, 139, 149, 149),
      const Color.fromARGB(255, 139, 149, 149),
    ];

    var imageList = [
      "images/Unisex_Chronographe_Quartz.png",
      "images/YWS420G_Menichelli.png",
      "images/Bijoux_Jewelry.png",
    ];

    var iconImageList = [
      "images/SYXG110G.png",
      "images/YCS590G.png",
      "images/Unisex_Chronographe_Quartz.png",
      "images/YWS420G_Menichelli.png",
      "images/Mens_Swiss_SY23S413.png",
      "images/Mens_Irony_Chronograph.png",
      "images/Swatchour_YVS426G.png",
      "images/Irony_pour_homme.png",
      "images/Analogique.png",
      "images/Apple_Swatch_Black.png",
    ];

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/ura.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  Text(
                    languageProvider.currentLocale.languageCode == 'en'
                        ? "LOGIN TO YOUR ACCOUNT"
                        : "تسجيل الدخول إلى حسابك",
                    style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 35),
                  customTextField(
                    hintText:
                        languageProvider.currentLocale.languageCode == 'en'
                            ? "Email"
                            : "بريد إلكتروني",
                    icon: Icons.email,
                  ),
                  const SizedBox(height: 20),
                  customTextField(
                    hintText:
                        languageProvider.currentLocale.languageCode == 'en'
                            ? "Password"
                            : "كلمة المرور",
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Navigating to Forgot Password Screen
                      },
                      child: Text(
                        languageProvider.currentLocale.languageCode == 'en'
                            ? "Forgot Password?"
                            : "هل نسيت كلمة السر؟",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  customButton(
                    context: context,
                    label: languageProvider.currentLocale.languageCode == 'en'
                        ? "Login"
                        : "تسجيل الدخول",
                    onPressed: () {
                      Navigator.pushNamed(context, "homepage");
                    },
                  ),
                  const SizedBox(height: 20),
                  customButton(
                    context: context,
                    label: languageProvider.currentLocale.languageCode == 'en'
                        ? "Sign Up"
                        : "قم بالتسجيل",
                    onPressed: () {
                      Navigator.pushNamed(context, "signup");
                    },
                    isSecondary: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
