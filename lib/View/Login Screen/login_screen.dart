import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

import 'package:app_e_ecommerce/View/Login%20Screen/ForgotPasswordScreen.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/components/custom_text_field.dart';
import 'package:app_e_ecommerce/View/language/language_provider.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login_Screen> {
  bool isLoginPressed = false;
  bool isSignUpPressed = false;

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final bool isEnglish = languageProvider.currentLocale.languageCode == 'en';

    // ألوان Gradient برتقالية دافئة
    const Color startColor = Color(0xFFFF7E5F); // برتقالي فاتح
    const Color endColor = Color(0xFFFD3A69); // برتقالي مائل للأحمر

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [startColor, endColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              isEnglish ? "LOGIN ACCOUNT" : "تسجيل الدخول إلى حسابك",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                    height: kToolbarHeight + 20), // لتعويض AppBar الشفاف
                Lottie.asset(
                  "Json/lo.json",
                  width: 300,
                  height: 300,
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
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
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordScreen(),
                              ),
                            );
                          },
                          child: Text(
                            isEnglish
                                ? "Forgot Password?"
                                : "هل نسيت كلمة السر؟",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 140,
                            height: 50,
                            decoration: BoxDecoration(
                              color: isLoginPressed
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  isLoginPressed = true;
                                  isSignUpPressed = false;
                                });
                                Future.delayed(
                                  const Duration(milliseconds: 300),
                                  () {
                                    Navigator.pushNamed(context, "homepage");
                                  },
                                );
                              },
                              child: Text(
                                isEnglish ? "Login" : "تسجيل الدخول",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: isLoginPressed
                                      ? startColor
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 140,
                            height: 50,
                            decoration: BoxDecoration(
                              color: isSignUpPressed
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  isSignUpPressed = true;
                                  isLoginPressed = false;
                                });
                                Future.delayed(
                                  const Duration(milliseconds: 300),
                                  () {
                                    Navigator.pushNamed(context, "signup");
                                  },
                                );
                              },
                              child: Text(
                                isEnglish ? "Sign Up" : "قم بالتسجيل",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: isSignUpPressed
                                      ? startColor
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
