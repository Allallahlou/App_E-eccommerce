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
    final bool isEnglish = languageProvider.currentLocale.languageCode == 'en';

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 150),
                Text(
                  isEnglish
                      ? "LOGIN TO YOUR ACCOUNT"
                      : "تسجيل الدخول إلى حسابك",
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 35),
                CustomTextField(
                  hintText: isEnglish ? "Email" : "البريد الإلكتروني",
                  icon: Icons.email,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: isEnglish ? "Password" : "كلمة المرور",
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
                      isEnglish ? "Forgot Password?" : "هل نسيت كلمة السر؟",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  label: isEnglish ? "Login" : "تسجيل الدخول",
                  onPressed: () {
                    Navigator.pushNamed(context, "homepage");
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  label: isEnglish ? "Sign Up" : "قم بالتسجيل",
                  onPressed: () {
                    Navigator.pushNamed(context, "signup");
                  },
                  isSecondary: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
