import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/components/custom_button.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/components/custom_text_field.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/components/social_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purpleAccent, Colors.blueAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Text(
                    languageProvider.currentLocale.languageCode == 'en'
                        ? "Login to your account"
                        : "تسجيل الدخول إلى حسابك",
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  customTextField(
                    hintText: languageProvider.currentLocale.languageCode == 'en'
                        ? "Email"
                        : "بريد إلكتروني",
                    icon: Icons.email,
                  ),
                  const SizedBox(height: 20),
                  customTextField(
                    hintText: languageProvider.currentLocale.languageCode == 'en'
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
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  customButton(
                    context: context,
                    label: languageProvider.currentLocale.languageCode == 'en' ? "Login" : "تسجيل الدخول",
                    onPressed: () {
                      Navigator.pushNamed(context, "signup");
                    },
                  ),
                  const SizedBox(height: 20),
                  customButton(
                    context: context,
                    label: languageProvider.currentLocale.languageCode == 'en' ? "Sign Up" : "قم بالتسجيل",
                    onPressed: () {
                      Navigator.pushNamed(context, "signup");
                    },
                    isSecondary: true,
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      socialButton(
                        imagePath: "images/google_icon.png",
                        onPressed: () {
                          // Function for Google login
                        },
                      ),
                    ],
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